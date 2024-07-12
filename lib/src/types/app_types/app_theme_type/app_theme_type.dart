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
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.blue,
      onSecondary: Colors.white,
      error: Colors.red.shade900,
      onError: Colors.white,
      errorContainer: Colors.red.shade50,
      surface: const Color.fromARGB(255, 4, 4, 4).inverted,
      surfaceBright: const Color.fromARGB(255, 0, 0, 0).inverted,
      surfaceContainerHighest: const Color.fromARGB(255, 64, 64, 64).inverted,
      surfaceContainerHigh: const Color.fromARGB(255, 56, 56, 56).inverted,
      surfaceContainer: const Color.fromARGB(255, 48, 48, 48).inverted,
      surfaceContainerLow: const Color.fromARGB(255, 32, 32, 32).inverted,
      surfaceContainerLowest: const Color.fromARGB(255, 16, 16, 16).inverted,
      surfaceDim: Colors.black26,
      onSurface: const Color.fromARGB(255, 4, 4, 4),
      shadow: Colors.black12,
    );
    final darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.lightBlue,
      onSecondary: Colors.black,
      error: Colors.red.shade200,
      onError: Colors.white,
      errorContainer: const LerpColorBlender().blend(
        Colors.red.shade900,
        Colors.grey.shade900,
        0.5,
      ),
      surface: const Color.fromARGB(255, 4, 4, 4),
      surfaceBright: const Color.fromARGB(255, 0, 0, 0),
      surfaceContainerHighest: const Color.fromARGB(255, 64, 64, 64),
      surfaceContainerHigh: const Color.fromARGB(255, 56, 56, 56),
      surfaceContainer: const Color.fromARGB(255, 48, 48, 48),
      surfaceContainerLow: const Color.fromARGB(255, 32, 32, 32),
      surfaceContainerLowest: const Color.fromARGB(255, 16, 16, 16),
      surfaceDim: Colors.black38,
      onSurface: const Color.fromARGB(255, 4, 4, 4).inverted,
      shadow: Colors.black26,
    );
    final buttonStyle = ButtonStyle(
      minimumSize: WidgetStateProperty.all(Size(48.sc, 48.sc)),
      padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 24.sc, vertical: 16.sc)),
      iconSize: WidgetStateProperty.all(24.sc),
      textStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (styles) {
          if (styles.contains(WidgetState.disabled)) {
            return textTheme.bodyLarge!.wBlack.copyWith(decoration: TextDecoration.lineThrough);
          }
          return textTheme.bodyLarge!.wBlack;
        },
      ),
    );
    final iconButtonStyle = buttonStyle.copyWith(
      padding: WidgetStateProperty.all(EdgeInsets.all(12.sc)),
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
          colorScheme: colorScheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: buttonStyle.merge(
              ElevatedButton.styleFrom(
                backgroundColor: colorScheme.surfaceContainer,
                disabledBackgroundColor: colorScheme.surfaceContainer.withOpacity(0.75),
              ),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: buttonStyle.merge(
              FilledButton.styleFrom(
                backgroundColor: colorScheme.primary,
                disabledBackgroundColor: colorScheme.primary.withOpacity(0.75),
              ),
            ),
          ),
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
          colorScheme: darkColorScheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: buttonStyle.merge(
              ElevatedButton.styleFrom(
                backgroundColor: darkColorScheme.surfaceContainer,
                disabledBackgroundColor: colorScheme.surfaceContainer.withOpacity(0.75),
              ),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: buttonStyle.merge(
              FilledButton.styleFrom(
                backgroundColor: darkColorScheme.primary,
                disabledBackgroundColor: colorScheme.primary.withOpacity(0.75),
              ),
            ),
          ),
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
