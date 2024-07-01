//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/foundation.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class RouteManager extends _RouteManager {
  //
  //
  //

  RouteManager({
    required super.authServiceBroker,
    required super.findScreen,
    required super.generatedScreenRoutes,
    required super.defaultOnLoginScreenConfiguration,
    required super.defaultOnLogoutScreenConfiguration,
  });

  //
  //
  //

  @override
  GoRouter get router => this._router;

  //
  //
  //

  final _navigatorKey = GlobalKey<NavigatorState>();

  //
  //
  //

  late final _router = GoRouter(
    errorPageBuilder: (context, state) {
      return super.commonPageBuilder(
        context,
        state,
        ErrorScreenConfiguration.PATH,
      );
    },
    initialLocation: super.defaultConfiguration.path,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final extra = state.extra;
          if (extra is ModelScreenConfiguration &&
              this._pScreenBreadcrumbs.value.lastOrNull != extra) {
            this._pScreenBreadcrumbs.update((e) {
              return (e..add(extra)).reversed.take(4).toList().reversed.toList();
            });
          }
          return child;
        },
        navigatorKey: this._navigatorKey,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const EmptyScreen(),
            routes: [
              ...super.generatedScreenRoutes.map(
                (route) {
                  final path = route.path;
                  return GoRoute(
                    path: path,
                    pageBuilder: (context, state) {
                      return this.commonPageBuilder(
                        context,
                        state,
                        path,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  //
  //
  //

  @override
  void go(ModelScreenConfiguration configuration) {
    ModelScreenConfiguration targetConfiguration;
    if (super.hasPermissionsToGoTo(configuration)) {
      targetConfiguration = configuration;
    } else {
      targetConfiguration = super.defaultConfiguration;
    }
    super.go(targetConfiguration);
  }

  //
  //
  //

  Future<void> goFromFront(int index) async {
    final chunk = super.pScreenBreadcrumbs.value.toList();
    final i = index;
    if (i >= 0 && i < chunk.length) {
      chunk.removeRange(i, chunk.length);
      await this._pScreenBreadcrumbs.set(chunk);
      final to = chunk.last;
      this.go(to);
    }
  }

  //
  //
  //

  Future<void> goFromBack(int index) async {
    final chunk = super.pScreenBreadcrumbs.value.toList();
    final i = chunk.length - index;
    if (i >= 0 && i < chunk.length) {
      chunk.removeRange(i, chunk.length);
      await this._pScreenBreadcrumbs.set(chunk);
      final to = chunk.last;
      this.go(to);
    }
  }

  //
  //
  //

  Future<void> goBack() async {
    final screenBreadcrumbs = super.pScreenBreadcrumbs.value;
    if (screenBreadcrumbs.length > 1) {
      await this._pScreenBreadcrumbs.update((e) => e..removeLast());
      final lastConfiguration = screenBreadcrumbs.lastOrNull;
      if (lastConfiguration != null) {
        this.go(lastConfiguration);
        return;
      }
    }
    this.go(super.defaultConfiguration);
  }

  //
  //
  //

  Future<void> goBackTo(ModelScreenConfiguration untilConfiguration) async {
    final chunk = super.pScreenBreadcrumbs.value.toList();
    final screenBreadcrumbs = super.pScreenBreadcrumbs.value.toList().reversed;
    for (final breadcrumb in screenBreadcrumbs) {
      if (breadcrumb == untilConfiguration) {
        break;
      }
      chunk.removeLast();
    }
    await super._pScreenBreadcrumbs.set(chunk);
    final to = chunk.lastOrNull;
    if (to != null) {
      this.go(to);
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract base class _RouteManager {
  //
  //
  //

  final AuthServiceInterface? authServiceBroker;
  final List<GoRoute> generatedScreenRoutes;
  final ModelScreenConfiguration? defaultOnLoginScreenConfiguration;
  final ModelScreenConfiguration defaultOnLogoutScreenConfiguration;
  final Screen? Function({
    required ModelScreenConfiguration configuration,
    required AuthServiceInterface? authServiceBroker,
  }) findScreen;

  //
  //
  //

  _RouteManager({
    required this.authServiceBroker,
    required this.generatedScreenRoutes,
    required this.defaultOnLoginScreenConfiguration,
    required this.defaultOnLogoutScreenConfiguration,
    required this.findScreen,
  });

  //
  //
  //

  final _pScreenBreadcrumbs = Pod<List<ModelScreenConfiguration>>([], disposable: false);
  PodListenable<List<ModelScreenConfiguration>> get pScreenBreadcrumbs => _pScreenBreadcrumbs;

  //
  //
  //

  ModelScreenConfiguration get defaultConfiguration => authServiceBroker?.loggedIn == true
      ? this.defaultOnLoginScreenConfiguration ?? this.defaultOnLogoutScreenConfiguration
      : this.defaultOnLogoutScreenConfiguration;

  //
  //
  //

  @protected
  GoRouter get router;

  //
  //
  //

  void go(ModelScreenConfiguration configuration) {
    final queryParameters = configuration.args
            ?.map(
              (k, v) => MapEntry(
                k is String ? k : null,
                v is String ? v : null,
              ),
            )
            .nonNulls
            .nullIfEmpty ??
        {};
    final to = Uri.decodeComponent(
      Uri(
        pathSegments: [configuration.path].nonNulls,
        queryParameters: queryParameters,
      ).toString(),
    );
    this.router.go(to, extra: configuration);
  }

  //
  //
  //

  @nonVirtual
  bool hasPermissionsToGoTo(ModelScreenConfiguration configuration) {
    final test = () {
      if (this._isInitialPage && configuration.isRedirectable == false) {
        return false;
      }
      if (this.authServiceBroker?.loggedIn != true &&
          configuration.isAccessibleOnlyIfLoggedIn == true) {
        return false;
      }
      if (this.authServiceBroker?.loggedIn == true &&
          configuration.isAccessibleOnlyIfLoggedOut == true) {
        return false;
      }
      return true;
    }();
    return test;
  }

  var _isInitialPage = true;

  //
  //
  //

  @nonVirtual
  @protected
  Page commonPageBuilder(
    BuildContext context,
    GoRouterState state,
    String requestedPath,
  ) {
    Page result = _emptyPage();
    final requestedPage = this._getPageByRegisteredRoute(
      context,
      state,
      this._getRegisteredRouteByPath(requestedPath),
    );
    final requestedScreen = this._getScreenFromPage(requestedPage);
    final requestedConfiguration = requestedScreen?.configuration;
    if (requestedConfiguration != null && hasPermissionsToGoTo(requestedConfiguration)) {
      this._isInitialPage = false;
      final targetScreen = this.findScreen(
        configuration: requestedConfiguration,
        authServiceBroker: authServiceBroker,
      );
      final targetConfiguration = targetScreen?.configuration;
      if (targetConfiguration != null) {
        final title = requestedScreen?.configuration?.title;
        if (title != null && title.isNotEmpty) {
          this._setHtmlTitle(title);
        }
        result = requestedPage!;
      } else {
        final newConfiguration = this.defaultConfiguration;
        Future.microtask(() {
          this.go(newConfiguration);
        });
      }
    }
    return result;
  }

  //
  //
  //

  GoRoute? _getRegisteredRouteByPath(String? path) {
    final route = this.generatedScreenRoutes.firstWhereOrNull((e) => e.path == path);
    return route;
  }

  //
  //
  //

  Page? _getPageByRegisteredRoute(
    BuildContext context,
    GoRouterState state,
    GoRoute? route,
  ) {
    final page = route?.pageBuilder?.call(context, state);
    return page;
  }

  //
  //
  //

  Screen? _getScreenFromPage(Page? page) {
    if (page is NoTransitionPage) {
      final screen = page.child;
      if (screen is Screen) {
        return screen;
      }
    }
    return null;
  }

  //
  //
  //

  NoTransitionPage<dynamic> _emptyPage() {
    return const NoTransitionPage(child: SizedBox.shrink());
  }

  //
  //
  //

  void _setHtmlTitle(String newTitle) {
    if (kIsWeb) {}
  }
}
