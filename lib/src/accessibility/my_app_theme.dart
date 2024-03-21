//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum MyAppTheme with AppThemeEnumMixin {
  //
  //
  //

  LIGHT,
  DARK;

  //
  //

  @override
  ThemeData get themeData {
    switch (this) {
      case MyAppTheme.LIGHT:
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: Colors.grey.shade900,
            primary: Colors.grey.shade900,
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: defaultTextTheme(),
        );
      case MyAppTheme.DARK:
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.grey.shade200,
            primary: Colors.grey.shade200,
          ),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: defaultTextTheme(),
        );
    }
  }
}
