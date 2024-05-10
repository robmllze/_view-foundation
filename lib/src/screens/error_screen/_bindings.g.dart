//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY 🇽🇾🇿 GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'error_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Serves as the blueprint for the [ErrorScreen] screen.
/// It outlines the screen's properties and behaviors prior to routing.
class ErrorScreenConfiguration extends ModelScreenConfiguration {
  //
  //
  //

  factory ErrorScreenConfiguration({
    Map<dynamic, dynamic>? $arguments,
  }) {
    return ErrorScreenConfiguration.unsafe(
      arguments: {
        ...?$arguments,
      },
    );
  }

  //
  //
  //

  ErrorScreenConfiguration.unsafe({
    Map<dynamic, dynamic>? arguments,
  }) : super.b(
          path: _PATH,
          arguments: arguments ?? {},
          isAccessibleOnlyIfLoggedInAndVerified:
              _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
          isAccessibleOnlyIfLoggedIn: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
          isAccessibleOnlyIfLoggedOut: _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
          isRedirectable: _IS_REDIRECTABLE,
        ) {
    super.navigationControlsWidget = NAVIGATION_CONTROLS_WIDGET;
    super.title = translatedTitle;
    super.makeup = screenMakeup;
  }

  //
  //
  //

  @override
  String get title => translatedTitle;

  //
  //
  //

  /// The name of the corresponding [Screen] class.
  static const CLASS = _CLASS;

  /// The path of the corresponding [Screen].
  static const PATH = _PATH;

  /// The segment of the corresponding [Screen] path.
  static const SEGMENT = _SEGMENT;

  /// The translation key for the corresponding [Screen].
  static const TR_KEY = _TR_KEY;

  /// Whether the corresponding [Screen] is only accessible if the user is logged in and verified.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN;

  /// Whether the corresponding [Screen] is only accessible if the user is logged in.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED;

  /// Whether the corresponding [Screen] is only accessible if the user is logged out.
  static const IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT =
      _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT;

  /// Whether the corresponding [Screen] is redirectable, i.e., if it can be requested from the browser URL.
  static const IS_REDIRECTABLE = _IS_REDIRECTABLE;

  /// The default navigation controls widget of the corresponding [Screen].
  static const NAVIGATION_CONTROLS_WIDGET = null;

  /// The title of the corresponding [Screen].
  static String get translatedTitle => screenTr('$_DEFAULT_TITLE||title');

  /// The defailt makeup of the corresponding [Screen].
  // ignore: prefer_const_declarations
  static final ScreenMakeup? screenMakeup = null;

  /// Translates the provided [key] using the screen's translation key.
  static String screenTr(String key, {Map<dynamic, dynamic> args = const {}}) {
    return key.splitByLastOccurrenceOf('||').join('||$_TR_KEY.').tr(args: args);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Extend this class to create a controller for the [ErrorScreen] screen.
abstract class _ControllerBroker<T1 extends ErrorScreen, T2 extends _View>
    extends ScreenController<ErrorScreenConfiguration> {
  /// The [Screen] that corresponds to `this` controller.
  late final screen = super.superScreen as T1;

  /// The [State] that corresponds to `this` controller.
  late final state = super.superState as T2;

  /// The [ModelScreenConfiguration] that corresponds to `this` controller.
  late final configuration = super.internalConfiguration ??
      ErrorScreenConfiguration.unsafe(
        arguments: screen.configuration?.arguments,
      );

  _ControllerBroker(
    super.superScreen,
    super.superState, [
    super.internalConfiguration,
  ]);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// The generated [GoRoute] that corresponds to [ErrorScreen].
final generatedErrorScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (context, state) {
    final extraConfiguration = letAs<ModelScreenConfiguration>(state.extra);
    final urlConfiguration = urlToScreenConfiguration(
      url: state.uri,
      isAccessibleOnlyIfLoggedIn:
          ErrorScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
      isAccessibleOnlyIfLoggedInAndVerified:
          ErrorScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
      isAccessibleOnlyIfLoggedOut:
          ErrorScreenConfiguration.IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
      isRedirectable: ErrorScreenConfiguration.IS_REDIRECTABLE,
      makeup: ErrorScreenConfiguration.screenMakeup,
      navigationControlsWidget:
          ErrorScreenConfiguration.NAVIGATION_CONTROLS_WIDGET,
      title: ErrorScreenConfiguration.translatedTitle,
    );
    final configuration = extraConfiguration ?? urlConfiguration;
    return NoTransitionPage(
      key: state.pageKey,
      child: ErrorScreen(
        key: ValueKey(configuration.toUrl()),
        configuration: configuration,
      ),
    );
  },
);

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension _ScreenTr on String {
  /// Translates this [String] using the translation key '_TR_KEY'. Optionally,
  /// pass [args] to replace placeholders in this String denoted by `{key}` in
  /// the translation.
  // ignore: unused_element
  String screenTr({Map<dynamic, dynamic> args = const {}}) {
    return ErrorScreenConfiguration.screenTr(this, args: args);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Returns a [ErrorScreen] instance if the [configuration] is of type
/// [ErrorScreenConfiguration] and if the current authentication status matches
/// [isLoggedInAndVerified], [isLoggedIn], and [isLoggedOut].
Screen? makerErrorScreen(
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
  if (configuration is ErrorScreenConfiguration) {
    return ErrorScreen(
      key: ValueKey<String?>(configuration.path),
      configuration: configuration,
    );
  }
  if (RegExp(r'^(' + _PATH + r')([?/].*)?$')
      .hasMatch(Uri.decodeComponent(configuration.path ?? ''))) {
    final temp = ErrorScreenConfiguration.unsafe(
      arguments: configuration.arguments,
    );
    return ErrorScreen(
      key: ValueKey(temp.toUrl()),
      configuration: temp,
    );
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// The controller [Type] corresponding to [ErrorScreen].
typedef TErrorScreenController = _ControllerBroker<ErrorScreen, _View>;

/// The [ScreenView] [Type] corresponding to [ErrorScreen].
typedef TErrorScreenView
    = ScreenView<ErrorScreen, ErrorScreenConfiguration, ErrorScreenController>;

/// The [ScreenPageView] [Type] corresponding to [ErrorScreen].
typedef TErrorScreenPageView<T extends ScreenPage>
    = ScreenPageView<T, ErrorScreenConfiguration, ErrorScreenController>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// The following constants are set by the generator based on the provided
// options. Together they form the behavior of the generated screen.

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = true;
const _CLASS = 'ErrorScreen';
const _SEGMENT = 'error';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.ErrorScreen';
const _DEFAULT_TITLE = 'Error';
