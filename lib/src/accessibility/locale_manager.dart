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
    final data = await rootBundle.loadString("assets/translations/$localeCode.yaml");
    return data;
  }

  //
  //
  //

  Future<void> loadLocaleFromDeviceStorage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final localeCode = sharedPreferences.getString("locale_code");
    final localeRef = localeCode != null ? LocaleRef.fromCode(localeCode) : this.locales.first;
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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class Languages {
  /// US English locale.
  static final ENGLISH_US = LocaleRef("en", "US");

  /// UK English locale.
  static final ENGLISH_UK = LocaleRef("en", "GB");

  /// Afrikaans in South Africa locale.
  static final AFRIKAANS_ZA = LocaleRef("af", "ZA");

  /// Standard German locale.
  static final GERMAN_DE = LocaleRef("de", "DE");

  /// Austrian German locale.
  static final GERMAN_AT = LocaleRef("de", "AT");

  /// European Spanish locale.
  static final SPANISH_ES = LocaleRef("es", "ES");

  /// Mexican Spanish locale.
  static final SPANISH_MX = LocaleRef("es", "MX");

  /// Standard French locale.
  static final FRENCH_FR = LocaleRef("fr", "FR");

  /// Canadian French locale.
  static final FRENCH_CA = LocaleRef("fr", "CA");

  /// Standard Italian locale.
  static final ITALIAN_IT = LocaleRef("it", "IT");

  /// Japanese locale.
  static final JAPANESE_JP = LocaleRef("ja", "JP");

  /// Korean locale.
  static final KOREAN_KR = LocaleRef("ko", "KR");

  /// Russian locale.
  static final RUSSIAN_RU = LocaleRef("ru", "RU");

  /// Simplified Chinese (Mainland China) locale.
  static final CHINESE_CN = LocaleRef("zh", "CN");

  /// Traditional Chinese (Taiwan) locale.
  static final CHINESE_TW = LocaleRef("zh", "TW");

  /// Hindi locale.
  static final HINDI_IN = LocaleRef("hi", "IN");

  /// European Portuguese locale.
  static final PORTUGUESE_PT = LocaleRef("pt", "PT");

  /// Brazilian Portuguese locale.
  static final PORTUGUESE_BR = LocaleRef("pt", "BR");

  /// Saudi Arabian Arabic locale.
  static final ARABIC_SA = LocaleRef("ar", "SA");

  /// Egyptian Arabic locale.
  static final ARABIC_EG = LocaleRef("ar", "EG");

  /// Hebrew locale.
  static final HEBREW_IL = LocaleRef("he", "IL");

  /// Persian (Farsi) locale.
  static final PERSIAN_IR = LocaleRef("fa", "IR");

  /// Turkish locale.
  static final TURKISH_TR = LocaleRef("tr", "TR");

  /// Dutch locale.
  static final DUTCH_NL = LocaleRef("nl", "NL");

  /// Swedish locale.
  static final SWEDISH_SE = LocaleRef("sv", "SE");

  /// Polish locale.
  static final POLISH_PL = LocaleRef("pl", "PL");

  /// Norwegian Bokmål locale.
  static final NORWEGIAN_NO = LocaleRef("nb", "NO");

  /// Norwegian Nynorsk locale.
  static final NORWEGIAN_NN = LocaleRef("nn", "NO");

  /// Finnish locale.
  static final FINNISH_FI = LocaleRef("fi", "FI");

  /// Danish locale.
  static final DANISH_DK = LocaleRef("da", "DK");

  /// Greek locale.
  static final GREEK_GR = LocaleRef("el", "GR");

  /// Hungarian locale.
  static final HUNGARIAN_HU = LocaleRef("hu", "HU");

  /// Czech locale.
  static final CZECH_CZ = LocaleRef("cs", "CZ");

  /// Slovak locale.
  static final SLOVAK_SK = LocaleRef("sk", "SK");

  /// Romanian locale.
  static final ROMANIAN_RO = LocaleRef("ro", "RO");

  /// Bulgarian locale.
  static final BULGARIAN_BG = LocaleRef("bg", "BG");

  /// Ukrainian locale.
  static final UKRAINIAN_UA = LocaleRef("uk", "UA");
}
