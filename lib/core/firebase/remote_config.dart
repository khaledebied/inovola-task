import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class FirebaseRemoteConfigService {
  FirebaseRemoteConfigService._() : _remoteConfig = FirebaseRemoteConfig.instance;
  static FirebaseRemoteConfigService? _instance; // NEW
  factory FirebaseRemoteConfigService() => _instance ??= FirebaseRemoteConfigService._(); // NEW
  final FirebaseRemoteConfig _remoteConfig;

  String? getString(String key) => _remoteConfig.getString(key);

  bool getBool(String key) => _remoteConfig.getBool(key);

  int? getNumber(String key) => _remoteConfig.getInt(key);

  Future<void> setConfigSettings() async =>
      _remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: const Duration(seconds: 20), minimumFetchInterval: const Duration(minutes: 2)));

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();
    if (updated) {
      debugPrint('The remote configuration has been updated.');
    } else {
      debugPrint('The remote configuration is not updated..');
    }
  }

  Future<void> initialize() async {
    await setConfigSettings();
    await fetchAndActivate();
  }
}

// to use it in your code, you can use it like this:
// String anthropicApiKey = FirebaseRemoteConfigService().getString("anthropicApiKey");
