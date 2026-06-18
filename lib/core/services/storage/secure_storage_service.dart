import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('fallback_$key', value);
    } catch (_) {}
  }

  Future<String?> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      if (value != null) return value;
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('fallback_$key');
    } catch (_) {}
    return null;
  }

  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('fallback_$key');
    } catch (_) {}
  }

  Future<void> clear() async {
    try {
      await _storage.deleteAll();
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys = prefs.getKeys();
      for (final k in keys) {
        if (k.startsWith('fallback_')) {
          await prefs.remove(k);
        }
      }
    } catch (_) {}
  }

  Future<bool> containsKey(String key) async {
    try {
      final contains = await _storage.containsKey(key: key);
      if (contains) return true;
    } catch (_) {}
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey('fallback_$key');
    } catch (_) {}
    return false;
  }
}
