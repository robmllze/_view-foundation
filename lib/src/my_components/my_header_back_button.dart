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

class MyHeaderBackButton extends StatelessWidget {
  //
  //
  //

  final void Function()? onBackButtonPressed;

  //
  //
  //
  const MyHeaderBackButton({
    super.key,
    this.onBackButtonPressed,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sc),
      child: Row(
        children: [
          IconButton(
            iconSize: 24.sc,
            color: Theme.of(context).colorScheme.primary,
            onPressed: onBackButtonPressed,
            icon: const Icon(FluentIcons.arrow_left_24_filled),
          ),
        ],
      ),
    );
  }
}