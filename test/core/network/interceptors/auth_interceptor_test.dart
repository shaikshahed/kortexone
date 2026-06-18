import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kortexone_mobile/core/constants/app_constants.dart';
import 'package:kortexone_mobile/core/network/interceptors/auth_interceptor.dart';
import 'package:kortexone_mobile/core/services/storage/secure_storage_service.dart';

class MockSecureStorageService extends Mock implements SecureStorageService {}
class MockRequestInterceptorHandler extends Mock implements RequestInterceptorHandler {}
class MockResponseInterceptorHandler extends Mock implements ResponseInterceptorHandler {}
class MockErrorInterceptorHandler extends Mock implements ErrorInterceptorHandler {}

void main() {
  late AuthInterceptor interceptor;
  late MockSecureStorageService mockSecureStorage;
  late MockRequestInterceptorHandler mockRequestHandler;
  late MockResponseInterceptorHandler mockResponseHandler;
  late MockErrorInterceptorHandler mockErrorHandler;

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/'));
    registerFallbackValue(Response(requestOptions: RequestOptions(path: '/')));
    registerFallbackValue(
      DioException(
        requestOptions: RequestOptions(path: '/'),
        type: DioExceptionType.badResponse,
      ),
    );
  });

  setUp(() {
    mockSecureStorage = MockSecureStorageService();
    mockRequestHandler = MockRequestInterceptorHandler();
    mockResponseHandler = MockResponseInterceptorHandler();
    mockErrorHandler = MockErrorInterceptorHandler();
    interceptor = AuthInterceptor(mockSecureStorage);
  });

  group('onRequest', () {
    test('should add Authorization and Cookie headers when tokens/cookies exist', () async {
      // arrange
      when(() => mockSecureStorage.read(AppConstants.tokenKey))
          .thenAnswer((_) async => 'mock_token');
      when(() => mockSecureStorage.read(AppConstants.cookiesKey))
          .thenAnswer((_) async => 'cookie1=val1; cookie2=val2');
      when(() => mockRequestHandler.next(any())).thenAnswer((_) {});

      final options = RequestOptions(path: '/test');

      // act
      await interceptor.onRequest(options, mockRequestHandler);

      // assert
      expect(options.headers['Authorization'], 'Bearer mock_token');
      expect(options.headers['cookie'], 'cookie1=val1; cookie2=val2');
      verify(() => mockRequestHandler.next(options)).called(1);
    });

    test('should bypass setting headers when requires-auth header is false', () async {
      // arrange
      final options = RequestOptions(path: '/test', headers: {'requires-auth': false});
      when(() => mockRequestHandler.next(any())).thenAnswer((_) {});

      // act
      await interceptor.onRequest(options, mockRequestHandler);

      // assert
      expect(options.headers.containsKey('Authorization'), false);
      expect(options.headers.containsKey('cookie'), false);
      expect(options.headers.containsKey('requires-auth'), false);
      verify(() => mockRequestHandler.next(options)).called(1);
    });
  });

  group('onResponse', () {
    test('should extract, merge and store cookies from Set-Cookie header', () async {
      // arrange
      when(() => mockSecureStorage.read(AppConstants.cookiesKey))
          .thenAnswer((_) async => 'cookie1=val1');
      when(() => mockSecureStorage.write(AppConstants.cookiesKey, any()))
          .thenAnswer((_) async => {});
      when(() => mockResponseHandler.next(any())).thenAnswer((_) {});

      final response = Response(
        requestOptions: RequestOptions(path: '/test'),
        headers: Headers.fromMap({
          'set-cookie': [
            'cookie2=val2; Path=/; Secure',
            'cookie1=new_val1; Path=/',
          ],
        }),
      );

      // act
      await interceptor.onResponse(response, mockResponseHandler);

      // assert
      verify(() => mockSecureStorage.write(
        AppConstants.cookiesKey,
        'cookie1=new_val1; cookie2=val2',
      )).called(1);
      verify(() => mockResponseHandler.next(response)).called(1);
    });
  });
}

