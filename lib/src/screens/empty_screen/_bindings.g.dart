//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// GENERATED BY 🇽🇾🇿 GEN - DO NOT MODIFY BY HAND
// See: https://github.com/robmllze/xyz_gen
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'empty_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final _globalKey = GlobalKey<_View>();

/// Serves as the blueprint for the [EmptyScreen] screen.
/// It outlines the screen's properties and behaviors prior to routing.
class EmptyScreenConfiguration extends ModelScreenConfiguration {
  //
  //
  //

  factory EmptyScreenConfiguration({
    Map<dynamic, dynamic>? $args,
  }) {
    return EmptyScreenConfiguration.c2(
      args: {
        ...?$args,
      }.nonNulls,
    );
  }

  //
  //
  //

  EmptyScreenConfiguration.c2({
    Map<dynamic, dynamic>? args,
  }) : super.c2(
          title: translatedTitle,
          path: _PATH,
          args: args ?? {},
          isAccessibleOnlyIfLoggedInAndVerified:
              _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED,
          isAccessibleOnlyIfLoggedIn: _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN,
          isAccessibleOnlyIfLoggedOut: _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT,
          isRedirectable: _IS_REDIRECTABLE,
        );

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

  /// The title of the corresponding [Screen].
  static String get translatedTitle => screenTr('$_DEFAULT_TITLE||title');

  /// Translates the provided [key] using the screen's translation key.
  static String screenTr(String key, {Map<dynamic, dynamic> args = const {}}) {
    return key.splitByLastOccurrenceOf('||').join('||$_TR_KEY.').tr(args: args);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Extend this class to create a controller for the [EmptyScreen] screen.
abstract base class _ControllerBroker<T1 extends EmptyScreen, T2 extends _View>
    extends ScreenController<EmptyScreenConfiguration> {
  /// The [Screen] that corresponds to `this` controller.
  late final screen = super.superScreen as T1;

  /// The [State] that corresponds to `this` controller.
  late final state = super.superState as T2;

  /// The [ModelScreenConfiguration] that corresponds to `this` controller.
  late final configuration = super.internalConfiguration ??
      EmptyScreenConfiguration.c2(
        args: screen.configuration?.args,
      );

  _ControllerBroker(
    super.superScreen,
    super.superState, [
    super.internalConfiguration,
  ]);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// The generated [GoRoute] that corresponds to [EmptyScreen].
final generatedEmptyScreenRoute = GoRoute(
  path: _SEGMENT,
  pageBuilder: (context, state) {
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
      title: EmptyScreenConfiguration.translatedTitle,
    );
    final configuration = extraConfiguration ?? urlConfiguration;
    return NoTransitionPage(
      key: state.pageKey,
      child: EmptyScreen(
        key: _globalKey,
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
    return EmptyScreenConfiguration.screenTr(this, args: args);
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Returns a [EmptyScreen] instance if the [configuration] is of type
/// [EmptyScreenConfiguration] and if the current authentication status matches
/// [isLoggedInAndVerified], [isLoggedIn], and [isLoggedOut].
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
  if (configuration is EmptyScreenConfiguration) {
    return EmptyScreen(
      key: _globalKey,
      configuration: configuration,
    );
  }
  if (RegExp(r'^(' + _PATH + r')([?/].*)?$')
      .hasMatch(Uri.decodeComponent(configuration.path ?? ''))) {
    final temp = EmptyScreenConfiguration.c2(
      args: configuration.args,
    );
    return EmptyScreen(
      key: _globalKey,
      configuration: temp,
    );
  }
  return null;
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// The controller [Type] corresponding to [EmptyScreen].
typedef TEmptyScreenController = _ControllerBroker<EmptyScreen, _View>;

/// The [ScreenView] [Type] corresponding to [EmptyScreen].
typedef TEmptyScreenView
    = ScreenView<EmptyScreen, EmptyScreenConfiguration, EmptyScreenController>;

/// The [ScreenPageView] [Type] corresponding to [EmptyScreen].
typedef TEmptyScreenPageView<T extends ScreenPage>
    = ScreenPageView<T, EmptyScreenConfiguration, EmptyScreenController>;

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// The following constants are set by the generator based on the provided
// options. Together they form the behavior of the generated screen.

const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN_AND_VERIFIED = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_IN = false;
const _IS_ACCESSIBLE_ONLY_IF_LOGGED_OUT = false;
const _IS_REDIRECTABLE = true;
const _CLASS = 'EmptyScreen';
const _SEGMENT = 'empty';
const _PATH = '/$_SEGMENT';
const _TR_KEY = 'screens.EmptyScreen';
const _DEFAULT_TITLE = 'Empty';
