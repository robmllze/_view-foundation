//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class BlurryOverlay extends StatelessWidget {
  //
  //
  //

  final Widget child;
  final VoidCallback? onTapBackground;

  //
  //
  //

  const BlurryOverlay({
    super.key,
    required this.child,
    this.onTapBackground,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: this.onTapBackground,
          child: Container(
            color: Theme.of(context).colorScheme.backdropColorMix,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 1,
            sigmaY: 1,
          ),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
