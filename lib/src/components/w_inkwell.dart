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

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WInkWell extends StatelessWidget {
  //
  //
  //

  final ShapeBorder? customBorder;
  final void Function()? onTap;
  final void Function(TapDownDetails details)? onTapDown;
  final BorderRadius? borderRadius;
  final bool? selected;
  final Widget? child;

  //
  //
  //

  const WInkWell({
    super.key,
    this.customBorder,
    this.onTap,
    this.onTapDown,
    this.borderRadius,
    this.selected,
    this.child,
  });

  //
  //

  //

  @override
  Widget build(BuildContext context) {
    final $borderRadius = borderRadius ?? BorderRadius.circular(8.sc);
    final $selectedBorder = customBorder ?? RoundedRectangleBorder(borderRadius: $borderRadius);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: selected == null
            ? customBorder
            : selected!
                ? $selectedBorder
                : customBorder,
        borderRadius: $borderRadius,
        onTap: this.onTap != null
            ? () {
                HapticFeedback.lightImpact();
                this.onTap!();
              }
            : null,
        onTapDown: this.onTapDown != null
            ? (details) {
                HapticFeedback.lightImpact();
                this.onTapDown!(details);
              }
            : null,
        child: this.child != null
            ? ClipRRect(
                borderRadius: $borderRadius,
                child: child,
              )
            : null,
      ),
    );
  }
}
