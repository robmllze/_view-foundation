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

class MyHeader extends StatelessWidget {
  //
  //
  //

  final String? title;
  final String? subtitle;
  final String? description;
  final List<Widget> leading;
  final List<Widget> trailing;
  final MyBreadCrumbBar? breadCrumbBar;
  final double? minHeight;
  final void Function()? onBackButtonPressed;

  //
  //
  //

  const MyHeader({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.leading = const [],
    this.trailing = const [],
    this.breadCrumbBar,
    this.minHeight,
    required this.onBackButtonPressed,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return WBlurryContainer(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16.sc),
        bottomRight: Radius.circular(16.sc),
      ),
      constraints: BoxConstraints(
        minHeight: minHeight ?? 100.sc,
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            if (this.breadCrumbBar != null) this.breadCrumbBar!,
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.sc),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4.sc,
                        runSpacing: 4.sc,
                        children: [
                          if (this.onBackButtonPressed != null) ...[
                            IconButton(
                              onPressed: onBackButtonPressed,
                              icon: Icon(
                                FluentIcons.arrow_left_24_filled,
                                color: Theme.of(context).colorScheme.primary,
                                size: 24.sc,
                              ),
                            ),
                          ],
                          WColumn(
                            children: [
                              if (this.title != null && this.title!.isNotEmpty)
                                Text(
                                  this.title!,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              if (this.subtitle != null && this.subtitle!.isNotEmpty) ...[
                                SizedBox(height: 2.sc),
                                Text(
                                  this.subtitle!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                              if (this.description != null && this.description!.isNotEmpty) ...[
                                SizedBox(height: 6.sc),
                                Text(
                                  this.description!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ],
                          ),
                          if (this.leading.isNotEmpty) ...this.leading,
                        ],
                      ),
                      if (this.trailing.isNotEmpty)
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ...this.trailing,
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
