// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_local_datasource.dart'
    as _i992;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/resend_otp_usecase.dart' as _i613;
import '../../features/auth/domain/usecases/verify_otp_usecase.dart' as _i503;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/auth/presentation/bloc/otp/otp_bloc.dart' as _i75;
import '../../features/ira/data/datasources/ira_remote_datasource.dart'
    as _i997;
import '../../features/ira/data/repositories/ira_repository_impl.dart' as _i277;
import '../../features/ira/domain/repositories/ira_repository.dart' as _i714;
import '../../features/ira/domain/usecases/get_agents_usecase.dart' as _i395;
import '../../features/ira/domain/usecases/get_chat_history_usecase.dart'
    as _i799;
import '../../features/ira/domain/usecases/get_files_usecase.dart' as _i561;
import '../../features/ira/domain/usecases/get_welcome_message_usecase.dart'
    as _i58;
import '../../features/ira/domain/usecases/get_welcome_suggestions_usecase.dart'
    as _i564;
import '../../features/ira/domain/usecases/send_message_usecase.dart' as _i730;
import '../../features/ira/presentation/bloc/ira_bloc.dart' as _i119;
import '../network/api_client.dart' as _i557;
import '../routes/app_router.dart' as _i629;
import '../services/logging/logger_service.dart' as _i111;
import '../services/storage/secure_storage_service.dart' as _i272;
import '../services/storage/shared_prefs_service.dart' as _i50;
import 'modules/network_module.dart' as _i851;
import 'modules/storage_module.dart' as _i148;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.sharedPrefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => storageModule.secureStorage,
    );
    gh.lazySingleton<_i111.LoggerService>(() => _i111.LoggerService());
    gh.lazySingleton<_i272.SecureStorageService>(
      () => _i272.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i557.ApiClient>(
      () => _i557.ApiClient(
        gh<_i361.Dio>(),
        gh<_i111.LoggerService>(),
        gh<_i272.SecureStorageService>(),
      ),
    );
    gh.lazySingleton<_i629.AppRouter>(
      () => _i629.AppRouter(gh<_i272.SecureStorageService>()),
    );
    gh.lazySingleton<_i50.SharedPrefsService>(
      () => _i50.SharedPrefsService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i997.IraRemoteDataSource>(
      () => _i997.IraRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i714.IraRepository>(
      () => _i277.IraRepositoryImpl(gh<_i997.IraRemoteDataSource>()),
    );
    gh.lazySingleton<_i161.AuthRemoteDataSource>(
      () => _i161.AuthRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.lazySingleton<_i992.AuthLocalDataSource>(
      () => _i992.AuthLocalDataSourceImpl(
        gh<_i272.SecureStorageService>(),
        gh<_i50.SharedPrefsService>(),
      ),
    );
    gh.factory<_i395.GetAgentsUseCase>(
      () => _i395.GetAgentsUseCase(gh<_i714.IraRepository>()),
    );
    gh.factory<_i799.GetChatHistoryUseCase>(
      () => _i799.GetChatHistoryUseCase(gh<_i714.IraRepository>()),
    );
    gh.factory<_i561.GetFilesUseCase>(
      () => _i561.GetFilesUseCase(gh<_i714.IraRepository>()),
    );
    gh.factory<_i58.GetWelcomeMessageUseCase>(
      () => _i58.GetWelcomeMessageUseCase(gh<_i714.IraRepository>()),
    );
    gh.factory<_i564.GetWelcomeSuggestionsUseCase>(
      () => _i564.GetWelcomeSuggestionsUseCase(gh<_i714.IraRepository>()),
    );
    gh.factory<_i730.SendMessageUseCase>(
      () => _i730.SendMessageUseCase(gh<_i714.IraRepository>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i161.AuthRemoteDataSource>(),
        gh<_i992.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i119.IraBloc>(
      () => _i119.IraBloc(
        gh<_i395.GetAgentsUseCase>(),
        gh<_i58.GetWelcomeMessageUseCase>(),
        gh<_i799.GetChatHistoryUseCase>(),
        gh<_i561.GetFilesUseCase>(),
        gh<_i730.SendMessageUseCase>(),
        gh<_i564.GetWelcomeSuggestionsUseCase>(),
      ),
    );
    gh.lazySingleton<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i613.ResendOtpUseCase>(
      () => _i613.ResendOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i503.VerifyOtpUseCase>(
      () => _i503.VerifyOtpUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i48.LogoutUseCase>(),
        gh<_i787.AuthRepository>(),
      ),
    );
    gh.factory<_i75.OtpBloc>(
      () => _i75.OtpBloc(
        gh<_i503.VerifyOtpUseCase>(),
        gh<_i613.ResendOtpUseCase>(),
      ),
    );
    return this;
  }
}

class _$StorageModule extends _i148.StorageModule {}

class _$NetworkModule extends _i851.NetworkModule {}
