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

class MyPlaceholder extends StatelessWidget {
  //
  //
  //

  final String message;
  final bool loading;
  final Widget? trailing;

  //
  //
  //

  const MyPlaceholder({
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
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 64.sc),
            MyBouncingIcon(
              bounce: this.loading,
              icon: Icon(
                FluentIcons.animal_dog_24_regular,
                size: 32.sc,
              ),
            ),
            const MyDivider(),
            Text(
              this.message,
              style: Theme.of(context).textTheme.bodyLarge?.wItalic,
              textAlign: TextAlign.center,
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
