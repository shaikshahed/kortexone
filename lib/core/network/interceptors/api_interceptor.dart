import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../services/logging/logger_service.dart';

class ApiInterceptor extends Interceptor {
  final LoggerService _logger;

  ApiInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final curl = _toCurl(options);
      debugPrint('\n┌─────────────────── API REQUEST (CURL) ───────────────────');
      debugPrint(curl);
      debugPrint('└──────────────────────────────────────────────────────────\n');
    } catch (e) {
      _logger.error('Failed to generate CURL: $e');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      debugPrint('\n┌─────────────────── API RESPONSE ───────────────────');
      debugPrint('Status Code: ${response.statusCode}');
      debugPrint('Method: ${response.requestOptions.method}');
      debugPrint('URL: ${response.requestOptions.uri}');
      
      final headers = response.headers.map;
      if (headers.isNotEmpty) {
        debugPrint('Headers:');
        headers.forEach((k, v) => debugPrint('  $k: ${v.join(', ')}'));
      }

      if (response.data != null) {
        debugPrint('Response Body:');
        if (response.data is Map || response.data is List) {
          final prettyJson = const JsonEncoder.withIndent('  ').convert(response.data);
          debugPrint(prettyJson);
        } else {
          debugPrint(response.data.toString());
        }
      }
      debugPrint('└────────────────────────────────────────────────────\n');
    } catch (e) {
      _logger.error('Failed to print response: $e');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    try {
      debugPrint('\n┌─────────────────── API ERROR ───────────────────');
      debugPrint('Error: ${err.message}');
      debugPrint('Method: ${err.requestOptions.method}');
      debugPrint('URL: ${err.requestOptions.uri}');
      
      final response = err.response;
      if (response != null) {
        debugPrint('Status Code: ${response.statusCode}');
        if (response.data != null) {
          debugPrint('Error Response Body:');
          if (response.data is Map || response.data is List) {
            final prettyJson = const JsonEncoder.withIndent('  ').convert(response.data);
            debugPrint(prettyJson);
          } else {
            debugPrint(response.data.toString());
          }
        }
      }
      debugPrint('└─────────────────────────────────────────────────\n');
    } catch (e) {
      _logger.error('Failed to print error: $e');
    }

    super.onError(err, handler);
  }

  String _toCurl(RequestOptions options) {
    final List<String> components = ['curl'];

    // Method
    components.add('-X ${options.method}');

    // Headers
    options.headers.forEach((k, v) {
      if (k != 'cookie') {
        components.add('-H "$k: $v"');
      }
    });

    // URI (automatically includes query parameters in Dio)
    components.add('"${options.uri.toString()}"');

    // Body data
    final data = options.data;
    if (data != null) {
      if (data is Map || data is List) {
        try {
          final rawJson = jsonEncode(data);
          final escapedJson = rawJson.replaceAll("'", "'\\''");
          components.add("-d '$escapedJson'");
        } catch (_) {
          final escapedData = data.toString().replaceAll("'", "'\\''");
          components.add("-d '$escapedData'");
        }
      } else if (data is FormData) {
        for (final entry in data.fields) {
          components.add("-F '${entry.key}=${entry.value}'");
        }
        for (final entry in data.files) {
          components.add("-F '${entry.key}=@${entry.value.filename}'");
        }
      } else {
        final escapedData = data.toString().replaceAll("'", "'\\''");
        components.add("-d '$escapedData'");
      }
    }

    return components.join(' \\\n  ');
  }
}

