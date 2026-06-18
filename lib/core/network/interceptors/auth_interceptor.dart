import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../../constants/app_constants.dart';
import '../../services/storage/secure_storage_service.dart';
import '../../di/injection.dart';
import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../features/auth/presentation/bloc/auth_event.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _secureStorage;
  final String _authHeaderKey = 'Authorization';

  AuthInterceptor(this._secureStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // If a request explicitly specifies that it does not require auth, bypass it
    if (options.headers.containsKey('requires-auth') &&
        options.headers['requires-auth'] == false) {
      options.headers.remove('requires-auth');
      return handler.next(options);
    }

    final accessToken = await _secureStorage.read(AppConstants.tokenKey);
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers[_authHeaderKey] = 'Bearer $accessToken';
      debugPrint('AuthInterceptor: Attached Authorization: Bearer $accessToken');
    } else {
      debugPrint('AuthInterceptor: Warning! Access token is empty/null, not attaching Authorization header');
    }

    final cookies = await _secureStorage.read(AppConstants.cookiesKey);
    if (cookies != null && cookies.isNotEmpty) {
      options.headers['cookie'] = cookies;
      debugPrint('AuthInterceptor: Attached Cookies: $cookies');
    } else {
      debugPrint('AuthInterceptor: Cookies are empty/null');
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // Check for Set-Cookie headers
    final setCookies = response.headers['Set-Cookie'] ?? response.headers['set-cookie'];
    if (setCookies != null && setCookies.isNotEmpty) {
      final existingCookies = await _secureStorage.read(AppConstants.cookiesKey);
      final mergedCookies = _parseAndMergeCookies(existingCookies, setCookies);
      if (mergedCookies != null) {
        await _secureStorage.write(AppConstants.cookiesKey, mergedCookies);
        debugPrint('AuthInterceptor: Set-Cookie parsed and merged: $mergedCookies');
      }
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If the request fails with 401 Unauthorized, attempt token refresh
    if (err.response?.statusCode == 401) {
      final refreshToken = await _secureStorage.read(AppConstants.refreshTokenKey);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        try {
          // Perform refreshing logic with a clean Dio instance to avoid recursive intercepts
          final dioRefresh = Dio(BaseOptions(
            baseUrl: err.requestOptions.baseUrl.isEmpty 
                ? 'https://dev.kortexone.ai' 
                : err.requestOptions.baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
          ));

          final refreshResponse = await dioRefresh.post(
            '/api/auth/refresh', // Adjust to match the correct refresh endpoint
            data: {'refresh_token': refreshToken},
          );

          if (refreshResponse.statusCode == 200 || refreshResponse.statusCode == 201) {
            final data = refreshResponse.data as Map<String, dynamic>;
            final newAccessToken = data['access_token'] as String?;
            final newRefreshToken = data['refresh_token'] as String?;

            if (newAccessToken != null && newAccessToken.isNotEmpty) {
              await _secureStorage.write(AppConstants.tokenKey, newAccessToken);
              if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
                await _secureStorage.write(AppConstants.refreshTokenKey, newRefreshToken);
              }

              // Extract and save cookies from the refresh response
              final setCookies = refreshResponse.headers['Set-Cookie'] ?? refreshResponse.headers['set-cookie'];
              if (setCookies != null && setCookies.isNotEmpty) {
                final existingCookies = await _secureStorage.read(AppConstants.cookiesKey);
                final mergedCookies = _parseAndMergeCookies(existingCookies, setCookies);
                if (mergedCookies != null) {
                  await _secureStorage.write(AppConstants.cookiesKey, mergedCookies);
                }
              }

              // Retry the original request with the fresh token and cookies
              final options = err.requestOptions;
              options.headers[_authHeaderKey] = 'Bearer $newAccessToken';
              
              final freshCookies = await _secureStorage.read(AppConstants.cookiesKey);
              if (freshCookies != null && freshCookies.isNotEmpty) {
                options.headers['cookie'] = freshCookies;
              }
              
              final retryResponse = await dioRefresh.request(
                options.path,
                data: options.data,
                queryParameters: options.queryParameters,
                options: Options(
                  method: options.method,
                  headers: options.headers,
                ),
              );

              return handler.resolve(retryResponse);
            }
          }
        } catch (e) {
          // Token refresh failed (e.g. refresh token expired). Clear session.
          await _secureStorage.delete(AppConstants.tokenKey);
          await _secureStorage.delete(AppConstants.refreshTokenKey);
          await _secureStorage.delete(AppConstants.cookiesKey);
          
          try {
            getIt<AuthBloc>().add(AuthLogoutRequested());
          } catch (ex) {
            debugPrint('AuthInterceptor: Failed to get/notify AuthBloc: $ex');
          }
        }
      }
    }
    super.onError(err, handler);
  }

  String? _parseAndMergeCookies(String? existingCookies, List<String> setCookies) {
    final Map<String, String> cookieMap = {};

    // Parse existing cookies
    if (existingCookies != null && existingCookies.isNotEmpty) {
      final parts = existingCookies.split(';');
      for (var part in parts) {
        final kv = part.split('=');
        if (kv.length >= 2) {
          cookieMap[kv[0].trim()] = kv.sublist(1).join('=').trim();
        }
      }
    }

    // Parse new cookies from Set-Cookie headers
    for (var setCookie in setCookies) {
      final mainPart = setCookie.split(';').first;
      final kv = mainPart.split('=');
      if (kv.length >= 2) {
        cookieMap[kv[0].trim()] = kv.sublist(1).join('=').trim();
      }
    }

    if (cookieMap.isEmpty) return null;

    // Convert back to string
    return cookieMap.entries.map((e) => '${e.key}=${e.value}').join('; ');
  }
}
