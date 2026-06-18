import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../config/app_config.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    return Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }
}
