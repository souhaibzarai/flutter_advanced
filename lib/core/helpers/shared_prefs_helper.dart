import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  const SharedPrefsHelper._();

  static Future<void> removeData(String key) async {
    final SharedPreferencesAsync sharedPreferencesAsync =
        SharedPreferencesAsync();

    await sharedPreferencesAsync.remove(key);
  }

  static Future<void> setData(String key, value) async {
    final SharedPreferencesAsync sharedPreferencesAsync =
        SharedPreferencesAsync();

    debugPrint('Set Data with key : $key and value : $value');
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferencesAsync.setString(key, value);
        break;
      case const (int):
        await sharedPreferencesAsync.setInt(key, value);
        break;
      case const (double):
        await sharedPreferencesAsync.setDouble(key, value);
        break;
      case const (List<String>):
        await sharedPreferencesAsync.setStringList(key, value);
        break;
      case const (bool):
        await sharedPreferencesAsync.setBool(key, value);
        break;
    }
  }

  /// Gets a String value from SharedPreferencesAsync with given [key]
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    final SharedPreferencesAsync sharedPreferencesAsync =
        SharedPreferencesAsync();
    return await sharedPreferencesAsync.getString(key) ?? '';
  }

  /// Gets an Int value from SharedPreferencesAsync with given [key]
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    final SharedPreferencesAsync sharedPreferencesAsync =
        SharedPreferencesAsync();
    return await sharedPreferencesAsync.getInt(key) ?? 0;
  }

  /// Gets a Double value from SharedPreferencesAsync with given [key]
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    final SharedPreferencesAsync sharedPreferencesAsync =
        SharedPreferencesAsync();
    return await sharedPreferencesAsync.getDouble(key) ?? 0.0;
  }

  /// Gets a Bool value from SharedPreferencesAsync with given [key]
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    final SharedPreferencesAsync sharedPreferencesAsync =
        SharedPreferencesAsync();
    return await sharedPreferencesAsync.getBool(key) ?? false;
  }

  /// Gets a String List from SharedPreferencesAsync with given [key]
  static Future<List<String>> getStringList(String key) async {
    debugPrint('SharedPrefHelper : getStringList with key : $key');
    final SharedPreferencesAsync sharedPreferencesAsync =
        SharedPreferencesAsync();
    return await sharedPreferencesAsync.getStringList(key) ?? [];
  }

  /// Set A SecuredString with FlutterSecureStorage with given [key] and [value]
  static Future<void> setSecuredString(String key, value) async {
    const fSecureStorage = FlutterSecureStorage();
    debugPrint(
      'FlutterSecureStorage : Set A SecuredString with given key : $key and value : $value',
    );
    await fSecureStorage.write(key: key, value: value);
  }

  /// Get A SecuredString with FlutterSecureStorage with given [key]
  static Future<String> getSecuredString(String key) async {
    const fSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : Get A SecuredString with key : $key');
    return await fSecureStorage.read(key: key) ?? '';
  }

  /// Remove all keys and values in the FlutterSecureStorage
  static Future<void> clearAllSecuredData() async {
    const fSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : Clear All Data');
    return await fSecureStorage.deleteAll();
  }
}
