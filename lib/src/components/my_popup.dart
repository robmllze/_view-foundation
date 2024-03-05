//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyPopup extends StatelessWidget {
  //
  //
  //

  final _globalKey = GlobalKey();

  //
  //
  //

  final Widget button;
  final Widget Function(
    BuildContext context,
    VoidCallback close,
  ) popupBuilder;
  final MyPopupController controller;

  //
  //
  //

  MyPopup({
    super.key,
    required this.button,
    required this.popupBuilder,
    required this.controller,
  }) {
    this.controller._myPopup ??= this;
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: this._globalKey,
      child: this.button,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyPopupController {
  //
  //
  //

  OverlayEntry? _overlayEntry;
  MyPopup? _myPopup;

  //
  //
  //

  final Sc elevation;
  final Duration? duration;

  //
  //
  //

  MyPopupController({
    this.elevation = const Sc(4.0),
    this.duration,
  });

  //
  //
  //

  void showPopup({
    required BuildContext context,
    AlignmentGeometry alignment = Alignment.topLeft,
    Offset? relativePosition,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    assert(this._myPopup != null);
    if (this._myPopup == null || this._overlayEntry != null) {
      return;
    }
    var l = left, t = top, r = right, b = bottom;
    if (relativePosition != null) {
      final renderBox = this._myPopup!._globalKey.currentContext?.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(relativePosition);
      l = (l ?? 0.0) + offset.dx;
      t = (t ?? 0.0) + offset.dy;
    }
    this._overlayEntry = OverlayEntry(
      builder: (context) {
        return BlurryOverlay(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              this.hidePopup();
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: t ?? 0.0,
                left: l ?? 0.0,
                right: r ?? 0.0,
                bottom: b ?? 0.0,
              ),
              child: Align(
                alignment: alignment,
                child: this._myPopup!.popupBuilder(context, this.hidePopup),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);

    if (this.duration != null) {
      Future.delayed(this.duration!, () {
        this.hidePopup();
      });
    }
  }

  //
  //
  //

  void hidePopup() {
    this._overlayEntry?.remove();
    this._overlayEntry = null;
  }
}
