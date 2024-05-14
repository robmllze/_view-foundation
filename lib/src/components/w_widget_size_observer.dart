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

class WidgetSizeObserver extends StatefulWidget {
  //
  //
  //

  final Widget child;
  final Function(Size size) onChange;

  //
  //
  //

  const WidgetSizeObserver({
    super.key,
    required this.child,
    required this.onChange,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WidgetSizeObserver> {
  //
  //
  //

  final _key = GlobalKey();

  //
  //
  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(this._afterLayout);
  }

  //
  //
  //

  void _afterLayout(_) {
    final renderBox = this._key.currentContext?.findRenderObject() as RenderBox;
    this.widget.onChange(renderBox.size);
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: this._key,
      child: this.widget.child,
    );
  }
}
