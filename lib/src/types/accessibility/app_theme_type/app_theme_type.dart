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
    final buttonStyle = ButtonStyle(
      textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16.sc)),
      minimumSize: WidgetStateProperty.all(Size(40.sc, 40.sc)),
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 16.sc, vertical: 8.sc)),
      iconSize: WidgetStateProperty.all(24.sc),
    );
    final iconButtonStyle = buttonStyle.copyWith(
      padding: WidgetStateProperty.all(EdgeInsets.all(8.sc)),
    );
    switch (this) {
      case AppThemeType.LIGHT:
        final border = OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.sc,
          ),
          borderRadius: BorderRadius.circular(4.sc),
        );
        return ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Colors.blue,
            onSecondary: Colors.white,
            error: Colors.red.shade900,
            onError: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            surfaceContainer: Colors.grey.shade200,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
          filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
          iconButtonTheme: IconButtonThemeData(style: iconButtonStyle),
          outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
          segmentedButtonTheme: SegmentedButtonThemeData(style: buttonStyle),
          textButtonTheme: TextButtonThemeData(style: buttonStyle),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: defaultTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.all(16.sc),
          ),
        );
      case AppThemeType.DARK:
        final border = OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 1.sc,
          ),
          borderRadius: BorderRadius.circular(4.sc),
        );
        return ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.white,
            onPrimary: Colors.black,
            secondary: Colors.lightBlue,
            onSecondary: Colors.black,
            error: Colors.red.shade200,
            onError: Colors.white,
            surface: Colors.black,
            onSurface: Colors.white,
            surfaceContainer: Colors.grey.shade900,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
          filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
          iconButtonTheme: IconButtonThemeData(style: iconButtonStyle),
          outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
          segmentedButtonTheme: SegmentedButtonThemeData(style: buttonStyle),
          textButtonTheme: TextButtonThemeData(style: buttonStyle),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: defaultTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
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
