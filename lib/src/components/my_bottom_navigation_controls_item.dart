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

class MyBottomNavigationControlsItem extends StatelessWidget {
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

  const MyBottomNavigationControlsItem({
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
          builder: (context, child, screenStack) {
            final currentPath = screenStack?.lastOrNull?.configuration?.path;
            final configurationPath = screenConfiguration?.path;
            final screenPathInSelections =
                this.selections?.any((e) => e.path == currentPath) ?? false;
            final selected = (!screenPathInSelections && configurationPath == null) ||
                (configurationPath == currentPath);
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sc),
                color: selected
                    ? Theme.of(context).colorScheme.onSurface.withOpacity(0.1)
                    : Colors.transparent,
              ),
              child: WInkWell(
                selected: selected,
                onTap: this.onTap != null
                    ? this.onTap!
                    : screenConfiguration != null
                        ? () => routeManager.go(screenConfiguration)
                        : null,
                child: Padding(
                  padding: EdgeInsets.all(8.sc),
                  child: Icon(
                    selected ? this.selectedIcon ?? this.icon : this.icon,
                    size: 24.sc,
                    color: LerpColorBlender(
                      color1: Theme.of(context).disabledColor,
                      color2: Theme.of(context).colorScheme.primary,
                      blendWeight: selected ? 0.75 : 0.25,
                    ).blend(),
                  ),
                ),
              ),
            );
          },
        ),
        if (this.countIndicator != null) this.countIndicator!,
      ],
    );
  }
}
