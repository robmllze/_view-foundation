//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

TextTheme defaultTextTheme() {
  return TextTheme(
    displayLarge: TextStyle(fontSize: 112.sc),
    displayMedium: TextStyle(fontSize: 56.sc),
    displaySmall: TextStyle(fontSize: 45.sc),
    headlineLarge: TextStyle(fontSize: 40.sc),
    headlineMedium: TextStyle(fontSize: 34.sc),
    headlineSmall: TextStyle(fontSize: 24.sc),
    titleLarge: TextStyle(fontSize: 22.sc),
    titleMedium: TextStyle(fontSize: 20.sc),
    titleSmall: TextStyle(fontSize: 18.sc),
    bodyLarge: TextStyle(fontSize: 16.sc),
    bodyMedium: TextStyle(fontSize: 14.sc),
    bodySmall: TextStyle(fontSize: 12.sc),
    labelLarge: TextStyle(
      fontSize: 14.sc,
      fontWeight: FONT_WEIGHT_MEDIUM,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sc,
      fontWeight: FONT_WEIGHT_MEDIUM,
    ),
    labelSmall: TextStyle(
      fontSize: 11.sc,
      fontWeight: FONT_WEIGHT_MEDIUM,
    ),
  );
}
