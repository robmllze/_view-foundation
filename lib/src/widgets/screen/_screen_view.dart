//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class ScreenView<T1 extends Screen, T2 extends ModelScreenConfiguration,
    T3 extends ScreenController<T2>> extends State<T1> {
  //
  //
  //

  static final _controllerCache = <Key, _ControllerCache>{};

  //
  //
  //

  late T3 c;
  T3 get screenController => this.c;

  //
  //
  //

  @override
  void initState() {
    final key = this.widget.key;
    final controllerTimeout = this.widget.controllerCacheTimeout;
    if (key != null) {
      if (_controllerCache[key] == null) {
        _controllerCache[key] = _ControllerCache(
          (this.widget.createController(this.widget, this)..initController()) as T3,
          controllerTimeout != null
              ? Debouncer(
                  delay: controllerTimeout,
                  onWaited: () {
                    this.c.dispose();
                    _controllerCache.remove(this.widget.key);
                  },
                )
              : null,
        );
      }
      this.c = _controllerCache[key]?.controller as T3;
      _controllerCache[key]?.debouncer?.cancel();
    } else {
      this.c = (this.widget.createController(this.widget, this)..initController()) as T3;
    }
    super.initState();
  }

  //
  //
  //

  @override
  void dispose() async {
    _controllerCache[this.widget.key]?.debouncer?.call();
    super.dispose();
  }

  //
  //
  //

  /// Override this method to define the screen's layout. Be sure to wrap the
  /// body in the super call.
  ///
  /// **Example:**
  ///
  /// ```dart
  /// @override
  /// Widget layout(BuildContext context, Widget body) {
  ///   return super.layout(
  ///     YourLayoutWidget(child: body);
  ///   );
  /// }
  /// ```
  @mustCallSuper
  Widget layout(BuildContext context, Widget body) {
    final makeup = letAs<ScreenMakeup>(this.widget.configuration?.makeup);
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;
        final header = this.header(context);
        final navigationControls = this.widget.configuration?.navigationControlsWidget;
        final footer = this.footer(context) ?? navigationControls;
        return SizedBox(
          width: maxWidth,
          height: maxHeight,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: maxWidth,
                  color: makeup?.backgroundColor ?? Theme.of(context).colorScheme.surface,
                  child: this.bodyScroll(
                        context,
                        body,
                        header: header,
                        footer: footer,
                        headerSpace: this.headerSpace,
                        footerSpace: this.footerSpace,
                      ) ??
                      body,
                ),
              ),
              if (header != null)
                Align(
                  alignment: Alignment.topCenter,
                  child: header,
                ),
              if (footer != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: footer,
                ),
            ],
          ),
        );
      },
    );
  }

  //
  //
  //

  Widget? bodyScroll(
    BuildContext context,
    Widget body, {
    required Widget? header,
    required Widget? footer,
    required double headerSpace,
    required double footerSpace,
  }) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.sc,
          right: 20.sc,
          top: header != null ? headerSpace : 0.0,
          bottom: footer != null ? footerSpace : 0.0,
        ),
        child: body,
      ),
    );
  }

  //
  //
  //

  Widget wideLayout(BuildContext context, Widget body) {
    return Container(
      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxHeight / MIN_MOBILE_ASPECT_RATIO,
                maxHeight: double.infinity,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: this.layout(context, body),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  //
  //
  //

  Widget mobileLayout(BuildContext context, Widget body) {
    return this.narrowLayout(context, body);
  }

  Widget horizontalMobileLayout(BuildContext context, Widget body) {
    return this.wideLayout(context, body);
  }

  Widget narrowLayout(BuildContext context, Widget body) {
    return this.layout(context, body);
  }

  //
  //
  //

  Widget body(BuildContext context);

  //
  //
  //

  Widget mobileBody(BuildContext context) {
    return this.narrowBody(context);
  }

  Widget horizontalMobileBody(BuildContext context) {
    return this.wideBody(context);
  }

  Widget narrowBody(BuildContext context) {
    return this.body(context);
  }

  Widget wideBody(BuildContext context) {
    return this.body(context);
  }

  //
  //
  //

  Widget? header(BuildContext context) => null;
  Widget? footer(BuildContext context) => null;

  double get headerSpace => 120.sc;
  double get footerSpace => 120.sc;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final calculator = ScreenCalculator(screenSize.width, screenSize.height);
    final appLayout = AppLayout.fromScreenCalculator(calculator);
    return SafeArea(
      top: false,
      maintainBottomViewPadding: true,
      child: () {
        switch (appLayout) {
          case AppLayout.MOBILE:
            return this.mobileLayout(context, this.mobileBody(context));
          case AppLayout.MOBILE_HORIZONTAL:
            return this.horizontalMobileLayout(context, this.horizontalMobileBody(context));
          case AppLayout.NARROW:
            return this.narrowLayout(context, this.narrowBody(context));
          case AppLayout.WIDE:
            return this.wideLayout(context, this.wideBody(context));
          default:
            return this.layout(context, this.body(context));
        }
      }(),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _ControllerCache {
  //
  //
  //

  final ScreenController controller;
  final Debouncer? debouncer;

  //
  //
  //

  const _ControllerCache(
    this.controller,
    this.debouncer,
  );
}
