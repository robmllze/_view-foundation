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

Future<void> showMessageOverlayWithErrorHandler(
  BuildContext context, {
  String? title,
  Widget? titleIcon,
  Object? message,
  Widget? leading,
  Widget? trailing,
  bool tapBackgroundToDismiss = false,
  Future<void> Function(void Function() remove)? remover,
  String errorMessageTitle = 'Error',
  String errorMessageCloseButtonLabel = 'Close',
}) {
  return showMessageOverlay(
    context,
    title: title,
    titleIcon: titleIcon,
    message: message,
    leading: leading,
    trailing: trailing,
    tapBackgroundToDismiss: tapBackgroundToDismiss,
    remover: (removeMessage) async {
      try {
        await remover?.call(removeMessage);
      } catch (e) {
        removeMessage();
        VoidCallback? removeError;
        if (context.mounted) {
          showMessageOverlay(
            context,
            title: errorMessageTitle,
            message: e.toString(),
            remover: (r) => removeError = r,
            tapBackgroundToDismiss: true,
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => removeError!(),
                  child: Text(errorMessageCloseButtonLabel),
                ),
              ],
            ),
          );
        }
      }
    },
  );
}
