//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter_svg/svg.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyAppIconProgressIndicator extends StatelessWidget {
  //
  //
  //

  final String assetName;
  final String? package;

  //
  //
  //

  const MyAppIconProgressIndicator({
    super.key,
    this.assetName = "assets/images/app_icon/app_icon.svg",
    this.package = "_view",
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final shade = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
    final invertedShade = shade.inverted;
    return SizedBox.square(
      dimension: 80.sc,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.square(
            dimension: 50.sc,
            child: ClipOval(
              child: SvgPicture.asset(
                this.assetName,
                package: this.package,
                colorFilter: ColorFilter.mode(
                  invertedShade,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox.square(
            dimension: 70.sc,
            child: CircularProgressIndicator(
              strokeWidth: 12.sc,
              color: invertedShade.withOpacity(0.25),
            ),
          ),
        ],
      ),
    );
  }
}
