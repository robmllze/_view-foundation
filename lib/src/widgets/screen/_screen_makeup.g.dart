//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY 🇽🇾🇿 GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'screen.dart'; // part '_screen_makeup.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ScreenMakeup {
  //
  //
  //

  Color? backgroundColor;
  bool? isTranslucent;
  Color? titleColor;
  Duration? transitionDuration;

  //
  //
  //

  ScreenMakeup({
    this.backgroundColor,
    this.isTranslucent,
    this.titleColor,
    this.transitionDuration,
  });

  //
  //
  //

  ScreenMakeup copyWith({
    Color? backgroundColor,
    bool? isTranslucent,
    Color? titleColor,
    Duration? transitionDuration,
  }) {
    return ScreenMakeup(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isTranslucent: isTranslucent ?? this.isTranslucent,
      titleColor: titleColor ?? this.titleColor,
      transitionDuration: transitionDuration ?? this.transitionDuration,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef FScreenMakeup = ScreenMakeup Function();
