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

Future<void> showErrorToastOverlay(
  BuildContext context, {
  Object? error,
  void Function(void Function() remove)? remover,
}) {
  return showToastOverlay(
    context,
    builder: (context, remove) {
      remover?.call(remove);
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: remove,
        child: Column(
          children: [
            const Spacer(),
            WAnimatedSlide(
              extent: 0.5,
              child: Container(
                constraints: BoxConstraints(maxWidth: 300.sc),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(12.sc),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.sc),
                  child: Text(
                    error.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
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
