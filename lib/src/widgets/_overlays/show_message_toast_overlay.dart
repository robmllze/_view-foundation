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

Future<void> showMessageToastOverlay(
  BuildContext context, {
  required Object? message,
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
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12.sc),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.sc),
                  child: Text(
                    message.toString(),
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