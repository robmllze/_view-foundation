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

Future<void> showMessageOverlay(
  BuildContext context, {
  String? title,
  Widget? titleIcon,
  Object? message,
  Widget? leading,
  Widget? trailing,
  bool tapBackgroundToDismiss = false,
  void Function(void Function() remove)? remover,
}) {
  return showOverlay(
    context,
    tapBackgroundToDismiss: tapBackgroundToDismiss,
    builder: (context, remove) {
      remover?.call(remove);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicWidth(
            child: MSurface(
              child: Padding(
                padding: EdgeInsets.all(32.sc),
                child: WColumn(
                  divider: SizedBox(height: 16.sc),
                  children: [
                    if (title != null) ...[
                      Wrap(
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          if (titleIcon != null) ...[
                            SizedBox(width: 8.sc),
                            titleIcon,
                          ],
                        ],
                      ),
                      const MDivider(),
                    ],
                    if (leading != null) leading,
                    if (message != null)
                      Text(
                        message.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    if (trailing != null) trailing,
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void Function(void Function())? removeInSeconds(int seconds) {
  return (r) => Future.delayed(Duration(seconds: seconds), r);
}

void Function(void Function())? removeInMilliseconds(int milliseconds) {
  return (r) => Future.delayed(Duration(milliseconds: milliseconds), r);
}
