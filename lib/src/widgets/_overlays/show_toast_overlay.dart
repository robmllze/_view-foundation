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

Future<void> showToastOverlay(
  BuildContext context, {
  required FutureOr<Widget> Function(
    BuildContext context,
    void Function() remove,
  ) builder,
}) {
  final completer = Completer();
  late final OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          color: Colors.transparent,
          child: FutureBuilder(
            future: () async {
              return await builder(context, () {
                overlayEntry.remove();
                completer.complete();
              });
            }(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data as Widget;
              }
              return const SizedBox();
            },
          ),
        ),
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);
  return completer.future;
}
