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

class WOverlayPopup extends StatelessWidget {
  //
  //
  //

  final Widget Function(BuildContext context, VoidCallback open)? buttonBuilder;
  final Widget Function(BuildContext context, VoidCallback close)? itemBuilder;

  //
  //
  //

  const WOverlayPopup({
    super.key,
    this.buttonBuilder,
    this.itemBuilder,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return PodWidget<Offset?>(
      initialValue: null,
      builder: (context, child, pPosition) {
        final position = pPosition.value;
        final button = buttonBuilder?.call(context, () => pPosition.set(Offset.zero));
        return Stack(
          children: [
            if (button != null) button,
            if (position != null)
              Builder(
                builder: (context) {
                  final overlay = WOverlay(
                    child: WPositionObserver(
                      onChanged: (position) => pPosition.set(position),
                      child: itemBuilder?.call(context, () => pPosition.set(null)) ??
                          const SizedBox.shrink(),
                    ),
                  );

                  if (position == Offset.zero) {
                    return Visibility(
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: overlay,
                    );
                  } else {
                    return WGlobalOverlay2(
                      left: position.dx,
                      top: position.dy,
                      background: GestureDetector(
                        onTap: () {
                          pPosition.set(null);
                        },
                        child: WBlurryContainer(
                          borderRadius: BorderRadius.zero,
                          sigma: 3.0,
                          expandHeight: true,
                          expandWidth: true,
                          color: Theme.of(context).colorScheme.surface.inverted,
                          opacity: 0.25,
                        ),
                      ),
                      child: overlay,
                    );
                  }
                },
              ),
          ],
        );
      },
    );
  }
}
