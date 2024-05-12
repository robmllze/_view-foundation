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

extension DefaultDistinctiveColorOnPublicBaseModelExtension on PublicBaseModel {
  //
  //
  //

  Color get defaultDistinctiveColor {
    return this.distinctiveColor ??
        (this.id != null ? mapTextToColor(this.displayNameSearchable!) : Colors.white);
  }

  //
  //
  //

  Color defaultDistincticeColorBlendedWithTheme(ThemeData themeData) {
    return blendDistincticeColorWithTheme(
      this.defaultDistinctiveColor,
      themeData,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Color generateNewDistinctiveColor() {
  final seed = IdUtils.newUuidV4();
  final color = mapTextToColor(
    seed,
    blendWeight: 0.5,
  );
  return color;
}

Color blendDistincticeColorWithTheme(Color color, ThemeData themeData) {
  return LerpBlender(
    color1: color,
    color2: themeData.colorScheme.surface,
    blendWeight: 0.5,
  ).blend();
}
