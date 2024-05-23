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

class WSendMessageButton extends StatelessWidget {
  //
  //
  //

  final FutureOr<void> Function()? onTapDown;

  //
  //
  //

  const WSendMessageButton({super.key, this.onTapDown});

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return WInkWell(
      onTapDown: this.onTapDown != null
          ? (_) async {
              await this.onTapDown!();
              HapticFeedback.lightImpact();
            }
          : null,
      child: SizedBox(
        width: 48.sc,
        height: 32.sc,
        child: Center(
          child: Icon(
            size: 24.sc,
            FluentIcons.send_24_filled,
          ),
        ),
      ),
    );
  }
}
