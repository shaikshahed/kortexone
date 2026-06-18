import 'dart:convert';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/storage/secure_storage_service.dart';
import '../../../../core/services/storage/shared_prefs_service.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearSession();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService _secureStorage;
  final SharedPrefsService _sharedPrefs;

  AuthLocalDataSourceImpl(this._secureStorage, this._sharedPrefs);

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(AppConstants.tokenKey, accessToken);
    await _secureStorage.write(AppConstants.refreshTokenKey, refreshToken);
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    await _sharedPrefs.setString(AppConstants.userKey, userJson);
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final token = await _secureStorage.read(AppConstants.tokenKey);
    if (token == null || token.isEmpty) {
      return null;
    }
    final userJson = _sharedPrefs.getString(AppConstants.userKey);
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> clearSession() async {
    await _secureStorage.delete(AppConstants.tokenKey);
    await _secureStorage.delete(AppConstants.refreshTokenKey);
    await _secureStorage.delete(AppConstants.cookiesKey);
    await _sharedPrefs.remove(AppConstants.userKey);
  }
}
