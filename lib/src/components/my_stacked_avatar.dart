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

class MyStackedAvatars extends StatelessWidget {
  //
  //
  //

  final List<String> urls;
  final Sc size;
  final Sc offset;

  //
  //
  //

  const MyStackedAvatars({
    super.key,
    required this.urls,
    this.size = const Sc(32.0),
    this.offset = const Sc(12.0),
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final offset = this.offset.sc;
    final size = this.size.sc;
    final children = <Widget>[];
    final length = min(urls.length, 10);
    for (var i = 0; i < length; i++) {
      final margin = i.toDouble() * offset;
      children.add(
        Positioned(
          left: margin,
          child: CircleAvatar(
            radius: size / 2.0,
            backgroundImage: NetworkImage(urls[i]),
            backgroundColor: Colors.transparent,
          ),
        ),
      );
    }

    return SizedBox(
      height: size,
      width: size + (length - 1) * offset,
      child: Stack(
        children: children,
      ),
    );
  }
}
