//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter_svg/svg.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MySvgAppIcon extends StatelessWidget {
  //
  //
  //

  final String assetName;
  final String? package;
  final double? size;
  final Color? backgroundColor;
  final double? innerPadding;

  //
  //
  //

  const MySvgAppIcon({
    super.key,
    this.assetName = 'assets/images/app_icon/app_icon.svg',
    this.package,
    this.size,
    this.backgroundColor = Colors.white,
    this.innerPadding,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final outterSize = this.size ?? 40.sc;
    final p = this.innerPadding ?? 4.sc;
    final innerSize = outterSize - p * 2;
    return Container(
      width: outterSize,
      height: outterSize,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: SizedBox.square(
        dimension: innerSize,
        child: ClipOval(
          child: SvgPicture.asset(
            this.assetName,
            package: this.package,
            width: innerSize,
            height: innerSize,
          ),
        ),
      ),
    );
  }
}
