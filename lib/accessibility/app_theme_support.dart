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

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
//
// Supported Themes.
//
// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum ThemeKey {
  LIGHT,
  DARK,
}

final appThemes = {
  () {
    return AppThemeBuilder(
      key: ThemeKey.LIGHT,
      builder: () => AppTheme(
        key: ThemeKey.LIGHT,
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: Colors.grey.shade900,
            primary: Colors.grey.shade900,
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: defaultTextTheme(),
        ),
      ),
    );
  }(),
  () {
    return AppThemeBuilder(
      key: ThemeKey.DARK,
      builder: () => AppTheme(
        key: ThemeKey.DARK,
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.grey.shade200,
            primary: Colors.grey.shade200,
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: defaultTextTheme(),
        ),
      ),
    );
  }(),
};

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// The app's default/current theme.
final pAppTheme = Pod<AppTheme>(getAppTheme(ThemeKey.LIGHT));

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Sets the app theme and saves it to the device's storage.
Future<void> setAppThemeToDeviceStorage(ThemeKey themeKey) async {
  final theme = appThemes.firstWhereOrNull((e) => e.key == themeKey)?.builder();
  if (theme != null) {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("app_theme", theme.key.name);
    await pAppTheme.set(theme);
  }
}

/// Loads the app theme from the device's storage.
Future<void> loadAppThemeFromDeviceStorage() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final themeKey = sharedPreferences.getString("app_theme");
  final theme = appThemes.firstWhereOrNull((e) => e.key == nameToThemeKey(themeKey))?.builder();
  if (theme != null) {
    await pAppTheme.set(theme);
  }
}

/// Returns the app theme for the given theme key.
AppTheme getAppTheme(ThemeKey themeKey) {
  return appThemes.where((e) => e.key == themeKey).first.builder();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Holds the theme builder for a theme key.
class AppThemeBuilder {
  final ThemeKey key;
  final AppTheme Function() builder;

  const AppThemeBuilder({
    required this.key,
    required this.builder,
  });
}

/// Holds the theme data for a theme key.
class AppTheme {
  final ThemeKey key;
  final ThemeData data;

  const AppTheme({
    required this.key,
    required this.data,
  });
}

/// Returns the theme key for the given theme name.
ThemeKey? nameToThemeKey(String? name) {
  if (name != null) {
    for (final a in ThemeKey.values) {
      if (name.trim().toLowerCase() == a.name.toLowerCase()) {
        return a;
      }
    }
  }
  return null;
}