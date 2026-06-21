import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import '../../config/app_config.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio {
    final dioInstance = Dio(
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

    // Optimize HttpClient settings for mobile platforms
    dioInstance.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        // Avoid looking up system proxy configuration on every request (massive speedup on mobile)
        client.findProxy = (uri) => 'DIRECT';
        // Set idle timeout for connection pool reuse
        client.idleTimeout = const Duration(seconds: 15);
        return client;
      },
    );

    return dioInstance;
  }
}
