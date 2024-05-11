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

class MyGradientOverlay extends StatelessWidget {
  //
  //
  //

  final MyGradientOverlayPosition position;

  //
  //
  //

  const MyGradientOverlay({
    super.key,
    required this.position,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.position == MyGradientOverlayPosition.TOP
          ? Alignment.topCenter
          : Alignment.bottomCenter,
      child: Column(
        children: [
          Container(
            height: 60.sc,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: this.position == MyGradientOverlayPosition.TOP
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                end: this.position == MyGradientOverlayPosition.TOP
                    ? Alignment.bottomCenter
                    : Alignment.topCenter,
                colors: [
                  Theme.of(context).colorScheme.background.withOpacity(
                        this.position == MyGradientOverlayPosition.TOP ? 1.0 : 0.0,
                      ),
                  Theme.of(context).colorScheme.background.withOpacity(
                        this.position == MyGradientOverlayPosition.TOP ? 0.0 : 1.0,
                      ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 20.sc,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.background.withOpacity(0.0),
                  Theme.of(context).colorScheme.background.withOpacity(1.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum MyGradientOverlayPosition {
  TOP,
  BOTTOM,
}
