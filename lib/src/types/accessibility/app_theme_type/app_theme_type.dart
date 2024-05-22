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
    final textTheme = defaultTextTheme();
    final buttonStyle = ButtonStyle(
      textStyle: WidgetStateProperty.all(textTheme.bodyMedium),
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
            errorContainer: Colors.red.shade50,
            surface: Colors.white,
            onSurface: Colors.black,
            surfaceContainer: Colors.grey.shade200,
            shadow: Colors.black12,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
          filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
          iconButtonTheme: IconButtonThemeData(style: iconButtonStyle),
          outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
          segmentedButtonTheme: SegmentedButtonThemeData(style: buttonStyle),
          textButtonTheme: TextButtonThemeData(style: buttonStyle),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: textTheme,
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: textTheme.labelMedium,
            labelStyle: textTheme.labelMedium,
            errorStyle: textTheme.labelMedium?.copyWith(color: Colors.red.shade900),
            hintStyle: textTheme.labelMedium?.copyWith(color: Colors.grey.shade500),
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
            errorContainer: const LerpBlender().blend(
              Colors.red.shade900,
              Colors.grey.shade900,
              0.5,
            ),
            surface: Colors.black,
            onSurface: Colors.white,
            surfaceContainer: Colors.grey.shade900,
            shadow: Colors.black26,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
          filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
          iconButtonTheme: IconButtonThemeData(style: iconButtonStyle),
          outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
          segmentedButtonTheme: SegmentedButtonThemeData(style: buttonStyle),
          textButtonTheme: TextButtonThemeData(style: buttonStyle),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: textTheme,
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: textTheme.labelMedium,
            labelStyle: textTheme.labelMedium,
            errorStyle: textTheme.labelMedium?.copyWith(color: Colors.red.shade200),
            hintStyle: textTheme.labelLarge?.copyWith(color: Colors.grey.shade600),
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
