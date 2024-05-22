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
    this._initController();
    super.initState();
  }

  //
  //
  //

  void _initController() {
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

  Widget view(
    BuildContext context,
    Widget body,
    EdgeInsets padding,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
    );
  }

  //
  //
  //

  Widget background(BuildContext context) {
    final makeup = letAs<ScreenMakeup>(this.widget.configuration?.makeup);
    return Container(
      color: Theme.of(context).colorScheme.surface,
    );
  }

  Widget foreground(BuildContext context) {
    return const IgnorePointer(
      child: SizedBox.expand(),
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

  Widget wideLayout(BuildContext context, Widget body) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
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
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow,
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: WSurface(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.transparent,
                  child: this.layout(context, body),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget layout(BuildContext context, Widget body) {
    return body;
  }

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

  @visibleForOverriding
  Widget body(BuildContext context) {
    return const SizedBox.shrink();
  }

  //
  //
  //

  Widget top(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget bottom(BuildContext context) {
    final navigationControls = this.widget.configuration?.navigationControlsWidget;
    return navigationControls ?? const SizedBox.shrink();
  }

  Widget left(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget right(BuildContext context) {
    return const SizedBox.shrink();
  }

  //
  //
  //

  EdgeInsets viewPadding() {
    return EdgeInsets.only(
      top: 120.sc,
      bottom: 120.sc,
      left: 20.sc,
      right: 20.sc,
    );
  }

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
            return this.mobileLayout(
              context,
              this._layoutWrapper(
                context,
                this.mobileBody(context),
              ),
            );
          case AppLayout.MOBILE_HORIZONTAL:
            return this.horizontalMobileLayout(
              context,
              this._layoutWrapper(
                context,
                this.horizontalMobileBody(context),
              ),
            );
          case AppLayout.NARROW:
            return this.narrowLayout(
              context,
              this._layoutWrapper(
                context,
                this.narrowBody(context),
              ),
            );
          case AppLayout.WIDE:
            return this.wideLayout(
              context,
              this._layoutWrapper(
                context,
                this.wideBody(context),
              ),
            );
          default:
            return this.layout(
              context,
              this._layoutWrapper(
                context,
                this.body(context),
              ),
            );
        }
      }(),
    );
  }

  //
  //
  //

  Widget _layoutWrapper(BuildContext context, Widget body) {
    final top = this.top(context);
    final bottom = this.bottom(context);
    final left = this.left(context);
    final right = this.right(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.expand(
          child: this.background(context),
        ),
        this.view(
          context,
          body,
          this.viewPadding(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: top,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: bottom,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: left,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: right,
        ),
        Align(
          alignment: Alignment.center,
          child: this.foreground(context),
        ),
      ],
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
