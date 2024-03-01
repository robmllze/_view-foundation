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

  const MyAppIconProgressIndicator({super.key});

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final shade = Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black;
    final invertedShade = shade.inverted;
    return SizedBox(
      width: 80.sc,
      height: 80.sc,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.square(
            dimension: 50.sc,
            child: ClipOval(
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                package: "_view",
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
