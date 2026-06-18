import 'package:dio/dio.dart';
import '../error/exceptions.dart';

class NetworkErrorHandler {
  static Exception handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkException('Connection timed out. Please check your internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        String message = 'An unexpected server error occurred.';
        
        if (data is Map && data.containsKey('message')) {
          message = data['message'].toString();
        } else if (data is Map && data.containsKey('error')) {
          message = data['error'].toString();
        }
        
        if (statusCode == 401 || statusCode == 403) {
          return AuthenticationException(message);
        }
        
        return ServerException(
          message: message,
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return const ServerException(message: 'Request was cancelled.');
      default:
        return const ServerException(message: 'Something went wrong. Please try again.');
    }
  }
}
