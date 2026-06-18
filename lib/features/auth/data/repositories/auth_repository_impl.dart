import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponse = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      
      if (loginResponse.requires2fa == true) {
        // Return incomplete user indicating OTP is required
        return Right(User(
          id: '',
          email: email,
          name: loginResponse.maskedEmail ?? '',
        ));
      }
      
      final session = loginResponse.session;
      if (session == null) {
        return Left(ServerFailure('Invalid response: Session is missing'));
      }

      final userModel = session.toUserModel();
      
      await _localDataSource.saveTokens(
        accessToken: loginResponse.accessToken,
        refreshToken: loginResponse.refreshToken,
      );
      await _localDataSource.cacheUser(userModel);

      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on AuthenticationException catch (e) {
      return Left(ServerFailure(e.message, statusCode: 401));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> verifyOtp({
    required String email,
    required String password,
    required String otp,
  }) async {
    try {
      final loginResponse = await _remoteDataSource.verifyOtp(
        email: email,
        password: password,
        otp: otp,
      );

      final session = loginResponse.session;
      if (session == null) {
        return Left(ServerFailure('Invalid response: Session is missing'));
      }

      final userModel = session.toUserModel();

      await _localDataSource.saveTokens(
        accessToken: loginResponse.accessToken,
        refreshToken: loginResponse.refreshToken,
      );
      await _localDataSource.cacheUser(userModel);

      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on AuthenticationException catch (e) {
      return Left(ServerFailure(e.message, statusCode: 401));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resendOtp({
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.resendOtp(
        email: email,
        password: password,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDataSource.logout();
      await _localDataSource.clearSession();
      return const Right(null);
    } on ServerException catch (e) {
      await _localDataSource.clearSession();
      return Left(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      await _localDataSource.clearSession();
      return Left(NetworkFailure(e.message));
    } catch (e) {
      await _localDataSource.clearSession();
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCachedUser() async {
    try {
      final userModel = await _localDataSource.getCachedUser();
      return Right(userModel?.toEntity());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
