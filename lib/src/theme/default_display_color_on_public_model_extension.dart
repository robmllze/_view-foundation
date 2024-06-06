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

extension DefaultDisplayColorOnPublicModelExtension on PublicModel {
  //
  //
  //

  Color get defaultDisplayColor {
    return this.displayColor ??
        (this.id != null ? mapTextToColor(this.displayNameSearchable!) : Colors.white);
  }

  //
  //
  //

  Color defaultDisplayColorBlendedWithTheme(ThemeData themeData) {
    return blendDisplayColorWithTheme(
      this.defaultDisplayColor,
      themeData,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Color generateNewDisplayColor() {
  final seed = IdUtils.newUuidV4();
  final color = mapTextToColor(
    seed,
    blendWeight: 0.5,
  );
  return color;
}

Color blendDisplayColorWithTheme(Color color, ThemeData themeData) {
  return LerpBlender(
    color1: color,
    color2: themeData.colorScheme.surface,
    blendWeight: 0.5,
  ).blend();
}
