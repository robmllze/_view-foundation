//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY 🇽🇾🇿 GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'app_theme_type.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension AppThemeTypeUtils on AppThemeType {
  AppThemeType get next {
    final index = (this.index + 1) % AppThemeType.values.length;
    return AppThemeType.values[index];
  }

  AppThemeType get previous {
    final index = (this.index - 1 + AppThemeType.values.length) %
        AppThemeType.values.length;
    return AppThemeType.values[index];
  }

  String get translated {
    return '${this.name}||types.$this'.tr();
  }

  String get friendlyName {
    return this
        .name
        .toSnakeCase()
        .split('_')
        .map((e) => e.capitalize())
        .join(' ');
  }
}
