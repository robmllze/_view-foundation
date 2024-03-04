//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/services.dart' show rootBundle;

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class LocaleManager {
  //
  //
  //

  late final pLocaleRef = Pod<LocaleRef>(this.locales.first);

  //
  //
  //

  final Set<LocaleRef> locales;

  //
  //
  //

  late final configManager = ConfigManager.create(
    Map.fromEntries(
      this.locales.map((locale) {
        return MapEntry(
          locale,
          ConfigFileRef(locale.localeCode),
        );
      }),
    ),
    this._loadLocaleConfig,
  );

  //
  //
  //

  LocaleManager({
    required this.locales,
  });

  //
  //
  //

  Future<String> _loadLocaleConfig(String localeCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("locale_code", localeCode);
    await pLocaleRef.set(LocaleRef.fromCode(localeCode));
    final data =
        await rootBundle.loadString("assets/translations/$localeCode.yaml");
    return data;
  }

  //
  //
  //

  Future<void> loadLocaleFromDeviceStorage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final localeCode = sharedPreferences.getString("locale_code");
    final localeRef = localeCode != null
        ? LocaleRef.fromCode(localeCode)
        : this.locales.first;
    await configManager.loadFileByConfigRef(localeRef);
    configManager.selectByConfigRef(localeRef);
  }

  //
  //
  //

  Future<void> setLocale(LocaleRef localeRef) async {
    await configManager.loadFileByConfigRef(localeRef);
    configManager.selectByConfigRef(localeRef);
  }
}
