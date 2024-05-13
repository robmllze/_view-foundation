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
  double get borderRadius => 8.sc;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer.darken(0.25).withOpacity(0.25),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(this.borderRadius),
          bottomRight: Radius.circular(this.borderRadius),
        ),
      ),
      height: this.height,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sc),
        child: PodBuilder(
          pod: this.routeManager.pScreenBreadcrumbs,
          builder: (context, child, screenStack) {
            final configurationStack = screenStack?.map((e) => e.configuration);
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  ...?configurationStack?.nonNulls.map((e) => e.path).nonNulls.mapi((path, n, _) {
                    final last = n == configurationStack.nonNulls.length - 1;
                    return InkWell(
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
