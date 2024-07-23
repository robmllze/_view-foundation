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

class MBottomNavigationControlsItem extends StatelessWidget {
  //
  //
  //

  final RouteManager routeManager;
  final int index;
  final List<ModelScreenConfiguration>? selections;
  final VoidCallback? onTap;
  final IconData icon;
  final IconData? selectedIcon;
  final Widget? countIndicator;

  //
  //
  //

  const MBottomNavigationControlsItem({
    super.key,
    required this.routeManager,
    required this.icon,
    this.index = -1,
    this.selectedIcon,
    this.selections,
    this.onTap,
    this.countIndicator,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final screenConfiguration =
        this.index >= 0 ? this.selections?.elementAtOrNull(this.index) : null;
    assert(
      screenConfiguration != null || onTap != null,
      'Either screenConfiguration or onTapDown must be provided ${this.index}: ${this.selections?.length}',
    );

    return Stack(
      alignment: Alignment.topRight,
      children: [
        PodBuilder(
          pod: routeManager.pScreenBreadcrumbs,
          builder: (context, child, screenBreadcrumbs) {
            final currentPath = screenBreadcrumbs?.lastOrNull?.path;
            final configurationPath = screenConfiguration?.path;
            final screenPathInSelections =
                this.selections?.any((e) => e.path == currentPath) ?? false;
            final selected = (!screenPathInSelections && configurationPath == null) ||
                (configurationPath == currentPath);
            return IconButton(
              onPressed: this.onTap != null
                  ? this.onTap!
                  : screenConfiguration != null
                      ? () => routeManager.go(screenConfiguration)
                      : null,
              icon: Icon(
                selected ? this.selectedIcon ?? this.icon : this.icon,
                size: 24.sc,
                color: LerpColorBlender(
                  color1: Theme.of(context).disabledColor,
                  color2: Theme.of(context).colorScheme.primary,
                  blendWeight: selected ? 0.75 : 0.25,
                ).blend(),
              ),
            );
          },
        ),
        if (this.countIndicator != null) this.countIndicator!,
      ],
    );
  }
}
