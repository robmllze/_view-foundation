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

part '_app_theme_type.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

@GenerateTypeUtils()
enum AppThemeType with AppThemeEnumMixin {
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
      case AppThemeType.LIGHT:
        return ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: Colors.white,
            primary: Colors.black,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 16.0, height: 1.2),
            bodyMedium: TextStyle(fontSize: 13.0, height: 1.2),
            bodySmall: TextStyle(fontSize: 10.0, height: 1.2),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            filled: true,
          ),
        );
      case AppThemeType.DARK:
        return ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Colors.white,
            primary: Colors.white,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 16.0, height: 1.2),
            bodyMedium: TextStyle(fontSize: 13.0, height: 1.2),
            bodySmall: TextStyle(fontSize: 10.0, height: 1.2),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            filled: true,
          ),
        );
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension ThemeDataExtension on ThemeData {
  InputDecoration get inputDecoration => InputDecoration(
        border: this.inputDecorationTheme.border,
        enabledBorder: this.inputDecorationTheme.enabledBorder,
        focusedBorder: this.inputDecorationTheme.focusedBorder,
        filled: this.inputDecorationTheme.filled,
        fillColor: this.inputDecorationTheme.fillColor,
      );
}
