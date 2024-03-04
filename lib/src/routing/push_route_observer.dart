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

class PushRouteObserver extends NavigatorObserver {
  //
  //
  //

  final Pod<Queue<Screen>>? pScreenBreadcrumbs;
  final void Function(
    Screen? newScreen,
    Screen? oldScreen,
  )? onPush;

  //
  //
  //

  PushRouteObserver({
    this.pScreenBreadcrumbs,
    this.onPush,
  });

  //
  //
  //

  @override
  void didPush(Route<dynamic> newRoute, Route<dynamic>? oldRoute) {
    final (newScreen, oldScreen) = this._routesToScreen(newRoute, oldRoute);
    if (newScreen != null) {
      this
          .pScreenBreadcrumbs
          ?.update((e) => _getLast4((e..addLast(newScreen))));
      Here().debugLog("Pushed: ${newScreen.configuration?.path}");
    }
    this.onPush?.call(
          newScreen,
          oldScreen,
        );
  }

  //
  //
  //

  (Screen?, Screen?) _routesToScreen(
    Route<dynamic>? route,
    Route<dynamic>? previousRoute,
  ) {
    Screen? screen;
    Screen? previousScreen;
    try {
      screen = (route?.settings as dynamic)?.child as Screen?;
    } catch (_) {}
    try {
      previousScreen = (previousRoute?.settings as dynamic)?.child as Screen?;
    } catch (_) {}
    return (screen, previousScreen);
  }

  //
  //
  //

  static Queue<Screen> _getLast4(Queue<Screen> e) {
    var noAdjacentDuplicates = _removeAdjacentDuplicates(e.toList());
    var last6 = noAdjacentDuplicates.reversed.take(4).toList().reversed;
    return Queue.of(last6);
  }

  //
  //
  //

  static List<Screen> _removeAdjacentDuplicates<T>(List<Screen> list) {
    if (list.isEmpty) return [];
    final result = [list.first];
    for (var i = 1; i < list.length; i++) {
      if (list[i].configuration != list[i - 1].configuration) {
        result.add(list[i]);
      }
    }

    return result;
  }
}
