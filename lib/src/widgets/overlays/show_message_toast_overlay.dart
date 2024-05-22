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

Future<void> showErrorToastOverlay(
  BuildContext context, {
  required Object? message,
  void Function(void Function() remove)? remover,
  Duration? duration = const Duration(seconds: 3),
}) {
  return showMessageToastOverlay(
    context,
    message: message,
    icon: Icon(
      FluentIcons.error_circle_24_regular,
      color: Theme.of(context).colorScheme.error,
      size: 24.sc,
    ),
    remover: remover,
    backgroundColor: Theme.of(context).colorScheme.errorContainer,
    duration: duration,
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> showMessageToastOverlay(
  BuildContext context, {
  required Object? message,
  Widget? icon,
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
                  color: backgroundColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.sc,
                    vertical: 12.sc,
                  ),
                  borderRadius: BorderRadius.circular(24.sc),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon,
                        SizedBox(width: 8.sc),
                      ],
                      Text(
                        message.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                        softWrap: true,
                      ),
                    ],
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
