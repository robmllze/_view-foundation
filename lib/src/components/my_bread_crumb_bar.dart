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

class MyBreadCrumbBar extends StatelessWidget {
  //
  //
  //

  final RouteManager routeManager;

  //
  //
  //

  const MyBreadCrumbBar({
    super.key,
    required this.routeManager,
  });

  //
  //
  //

  double get height => 32.sc;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      height: this.height,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sc),
        child: PodBuilder(
          pod: this.routeManager.pScreenBreadcrumbs,
          builder: (context, child, screenBreadcrumbs) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  ...?screenBreadcrumbs?.nonNulls.map((e) => e.path).nonNulls.mapi((path, n, _) {
                    final last = n == screenBreadcrumbs.nonNulls.length - 1;
                    return MInkWell(
                      onTap: !last ? () => this.routeManager.goFromFront(n + 1) : null,
                      child: Text(
                        path,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: last
                                  ? Theme.of(context).colorScheme.onSurface.withOpacity(0.5)
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
