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
    return InkWell(
      onTapDown: this.onTapDown != null
          ? (_) async {
              await this.onTapDown!();
              HapticFeedback.lightImpact();
            }
          : null,
      child: Container(
        width: 48.sc,
        height: 32.sc,
        alignment: Alignment.center,
        child: Icon(
          size: 24.sc,
          FluentIcons.send_24_filled,
        ),
      ),
    );
  }
}
