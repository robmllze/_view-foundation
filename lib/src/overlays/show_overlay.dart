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

Future<void> showOverlay(
  BuildContext context, {
  bool tapBackgroundToDismiss = true,
  required FutureOr<Widget> Function(
    BuildContext context,
    void Function() remove,
  ) builder,
}) {
  final completer = Completer();
  late final OverlayEntry overlayEntry;

  void complete() {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
    if (!completer.isCompleted) {
      completer.complete();
    }
  }

  overlayEntry = OverlayEntry(
    builder: (context) {
      return WBlurryOverlay(
        onTapBackground: tapBackgroundToDismiss ? complete : null,
        child: FutureBuilder(
          future: () async {
            return await builder(context, complete);
          }(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data as Widget;
            }
            return const SizedBox.shrink();
          },
        ),
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);
  return completer.future;
}
