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

Future<void> showMessageToastOverlay(
  BuildContext context, {
  required Object? message,
  void Function(void Function() remove)? remover,
  Color? backgroundColor,
  Duration? duration = const Duration(seconds: 3),
}) {
  return showToastOverlay(
    context,
    builder: (context, remove) {
      remover?.call(remove);
      if (duration != null) {
        Future.delayed(duration, remove);
      }
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: remove,
        child: Column(
          children: [
            const Spacer(),
            IntrinsicWidth(
              child: WAnimatedSlide(
                extent: 0.5,
                child: WSurface(
                  child: Padding(
                    padding: EdgeInsets.all(12.sc),
                    child: Text(
                      message.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.sc),
          ],
        ),
      );
    },
  );
}
