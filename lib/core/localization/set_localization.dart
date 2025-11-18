import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:expense_tracker/core/firebase/remote_config.dart';

class SetLocalization {
  late final Locale locale;
  SetLocalization(this.locale);

  static SetLocalization? of(BuildContext context) {
    return Localizations.of<SetLocalization>(context, SetLocalization);
  }

  static const LocalizationsDelegate<SetLocalization> localizationsDelegate = _GetLocalizationDelegate();

  Map<String, dynamic> _localizedValues = {};

  Future loadJson(Locale locale) async {
    final remoteConfigKey = locale.languageCode;
    final remoteConfig = FirebaseRemoteConfigService();
    String? languageData = remoteConfig.getString(remoteConfigKey) == "" ? "{}" : remoteConfig.getString(remoteConfigKey);
    _localizedValues = jsonDecode(languageData ?? "{}");
  }

  dynamic getTranslateValue(String key) {
    return (_localizedValues[key] ?? key);
  }
}

class _GetLocalizationDelegate extends LocalizationsDelegate<SetLocalization> {
  const _GetLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<SetLocalization> load(Locale locale) async {
    SetLocalization localization = SetLocalization(locale);
    await localization.loadJson(locale);
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<SetLocalization> old) {
    return true;
  }
}
