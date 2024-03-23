//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licensing details can be found in the LICENSE file in the root directory.
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
    overlayEntry.remove();
    completer.complete();
  }

  overlayEntry = OverlayEntry(
    builder: (context) {
      return BlurryOverlay(
        onTapBackground: tapBackgroundToDismiss ? complete : null,
        child: FutureBuilder(
          future: () async {
            return await builder(context, complete);
          }(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data as Widget;
            }
            return const SizedBox();
          },
        ),
      );
    },
  );

  Overlay.of(context).insert(overlayEntry);
  return completer.future;
}
