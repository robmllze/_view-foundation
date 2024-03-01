//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY XYZ_GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'empty_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = true;

const _CLASS = "EmptyScreen";
const _SEGMENT = "empty";
const _PATH = "/$_SEGMENT";
const _TR_KEY = "screens.EmptyScreen";

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension _ScreenTr on String {
  String screenTr([Map<dynamic, dynamic> args = const {}]) {
    return this.splitByLastOccurrenceOf("||").join("||$_TR_KEY.").tr(args);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Screen? makerEmptyScreen(
  ModelScreenConfiguration configuration,
  bool isLoggedInAndVerified,
  bool isLoggedIn,
  bool isLoggedOut,
) {
  if ((_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED &&
          !isLoggedInAndVerified) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_IN && !isLoggedIn) ||
      (_IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT && !isLoggedOut)) {
    return null;
  }
  if (configuration is EmptyScreenConfiguration ||
      RegExp(
        r"^(" + _PATH + r")([?/].*)?$",
      ).hasMatch(
        Uri.decodeComponent(
          configuration.path ?? "",
        ),
      )) {
    return EmptyScreen(
      key: globalKeyEmptyScreen, //ValueKey<String?>(configuration.path),
      configuration: configuration,
    );
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class EmptyScreenConfiguration extends ModelScreenConfiguration {
  static const CLASS = _CLASS;
  static const SEGMENT = _SEGMENT;
  static const PATH = _PATH;
  static const TR_KEY = _TR_KEY;
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN;
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED;
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT;
  static const IS_REDIRECTABLE = _IS_REDIRECTABLE;
  static const NAVIGATION_CONTROLS_WIDGET = null;
  static const TITLE = "Empty||title";
  // ignore: prefer_const_declarations
  static final ScreenMakeup? screenMakeup = null;

  EmptyScreenConfiguration({
    Map<dynamic, dynamic>? $arguments,
  }) : super(
          path: _PATH,
          arguments: {
            ...?$arguments,
          },
          isAccessibleOnlyIfLoggedInAndVerified:
              _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
          isAccessibleOnlyIfLoggedIn: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
          isAccessibleOnlyIfLoggedOut: _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
          isRedirectable: _IS_REDIRECTABLE,
        ) {
    super.navigationControlsWidget = NAVIGATION_CONTROLS_WIDGET;
    super.title = TITLE.screenTr();
    super.makeup = screenMakeup;
  }

  EmptyScreenConfiguration.fromArgs(Map<dynamic, dynamic>? args)
      : super(
          path: _PATH,
          arguments: args,
          isAccessibleOnlyIfLoggedInAndVerified:
              _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
          isAccessibleOnlyIfLoggedIn: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
          isAccessibleOnlyIfLoggedOut: _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
          isRedirectable: _IS_REDIRECTABLE,
        ) {
    super.navigationControlsWidget = NAVIGATION_CONTROLS_WIDGET;
    super.title = TITLE.screenTr();
    super.makeup = screenMakeup;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class _ControllerBroker<T1 extends EmptyScreen, T2 extends _View>
    extends ScreenController<EmptyScreenConfiguration> {
  late final screen = super.superScreen as T1;
  late final state = super.superState as T2;
  late final configuration = EmptyScreenConfiguration.fromArgs(
    screen.configuration?.arguments ?? {},
  );

  _ControllerBroker(super.superScreen, super.superState);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final generatedEmptyScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (_, GoRouterState state) {
    final extraConfiguration = letAs<ModelScreenConfiguration>(state.extra);
    final urlConfiguration = urlToScreenConfiguration(
      url: state.uri,
      isAccessibleOnlyIfLoggedIn:
          EmptyScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
      isAccessibleOnlyIfLoggedInAndVerified:
          EmptyScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
      isAccessibleOnlyIfLoggedOut:
          EmptyScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
      isRedirectable: EmptyScreenConfiguration.IS_REDIRECTABLE,
      makeup: EmptyScreenConfiguration.screenMakeup,
      navigationControlsWidget:
          EmptyScreenConfiguration.NAVIGATION_CONTROLS_WIDGET,
      title: EmptyScreenConfiguration.TITLE.screenTr(),
    );
    final configuration = extraConfiguration ?? urlConfiguration;
    return NoTransitionPage(
      key: state.pageKey,
      child: EmptyScreen(
        key: ValueKey<String?>(configuration.path),
        configuration: configuration,
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef TEmptyScreenController = _ControllerBroker<EmptyScreen, _View>;

typedef TEmptyScreenView
    = ScreenView<EmptyScreen, EmptyScreenConfiguration, EmptyScreenController>;

typedef TEmptyScreenPageView<T extends ScreenPage>
    = ScreenPageView<T, EmptyScreenConfiguration, EmptyScreenController>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final globalKeyEmptyScreen = GlobalKey<_View>();
