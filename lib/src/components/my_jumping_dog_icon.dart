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

class MyJumpingDogIcon extends StatefulWidget {
  //
  //
  //

  final bool jumping;

  //
  //
  //

  const MyJumpingDogIcon({
    super.key,
    required this.jumping,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<MyJumpingDogIcon> with SingleTickerProviderStateMixin {
  //
  //
  //

  late AnimationController _controller;
  late Animation<double> _animation;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    this._animation = Tween<double>(begin: 0.0, end: -30.sc).animate(
      CurvedAnimation(parent: this._controller, curve: Curves.easeOutQuad),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          this._controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          if (this.widget.jumping) {
            this._controller.forward();
          }
        }
      });

    if (this.widget.jumping) {
      this._controller.forward();
    }
  }

  //
  //
  //

  @override
  void didUpdateWidget(MyJumpingDogIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (this.widget.jumping != oldWidget.jumping) {
      if (this.widget.jumping) {
        this._controller.forward();
      } else {
        this._controller.stop();
        this._controller.reverse(from: this._controller.value);
      }
    }
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this._controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, this._animation.value),
        child: child,
      ),
      child: Icon(
        FluentIcons.animal_dog_24_regular,
        size: 64.sc,
      ),
    );
  }

  //
  //
  //

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }
}
