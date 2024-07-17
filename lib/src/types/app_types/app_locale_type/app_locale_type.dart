//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/services.dart';

import '/_common.dart';

part '_app_locale_type.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

//@GenerateTypeUtils() // TODO: put back when available
enum AppLocaleType with AppLocaleEnumMixin {
  //
  //
  //

  // NB: File names are case sensitive on most Linux based systems like
  // Firebase Hosting. Make sure to use the correct case for your file paths.
  // As a rule of thumb, always use lowercase file paths.
  en_us('en_us');

  //
  //
  //

  @override
  final String localeCode;

  //
  //
  //

  const AppLocaleType(this.localeCode);

  //
  //
  //
  @override
  TranslationFileReader get translationFileReader {
    return TranslationFileReader(
      translationsDirPath: ['assets', 'translations'],
      fileReader: (filePath) => rootBundle.loadString(filePath),
    );
  }
}
