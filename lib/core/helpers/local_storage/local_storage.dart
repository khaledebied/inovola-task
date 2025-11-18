import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalStorage {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setItem(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String?> getItem(String key) async {
    return _prefs.getString(key);
  }

  Future<void> removeItem(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }

  Future<void> setObject(String key, Map<String, dynamic> object) async {
    await _prefs.setString(key, json.encode(object));
  }

  Future<Map<String, dynamic>?> getObject(String key) async {
    String? jsonString = _prefs.getString(key);
    if (jsonString != null) {
      return json.decode(jsonString);
    }
    return null;
  }
}
