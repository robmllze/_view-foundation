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

class MyEmptyPlaceholder extends StatelessWidget {
  //
  //
  //

  final String message;
  final bool loading;
  final Widget? trailing;

  //
  //
  //

  const MyEmptyPlaceholder({
    super.key,
    this.message = 'No items found.',
    this.loading = false,
    this.trailing,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300.sc,
        child: Column(
          children: [
            SizedBox(height: 64.sc),
            MyJumpingDogIcon(
              jumping: this.loading,
            ),
            const Divider(),
            Text(
              this.message,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (this.trailing != null)
              Column(
                children: [
                  SizedBox(height: 20.sc),
                  this.trailing!,
                ],
              ),
            SizedBox(height: 64.sc),
          ],
        ),
      ),
    );
  }
}
