//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyHeader extends StatelessWidget {
  //
  //
  //

  final String? title;
  final List<Widget> leadingActions;
  final List<Widget> trailingActions;
  final Widget? breadCrumbBar;
  final void Function()? onBackButtonPressed;

  //
  //
  //

  const MyHeader({
    super.key,
    this.leadingActions = const [],
    this.title,
    this.trailingActions = const [],
    this.breadCrumbBar,
    required this.onBackButtonPressed,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.breadCrumbBar != null) this.breadCrumbBar!,
        Container(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.all(12.sc),
            child: WRow(
              crossAxisAlignment: CrossAxisAlignment.center,
              divider: SizedBox(width: 12.sc),
              children: [
                if (this.onBackButtonPressed != null)
                  IconButton(
                    iconSize: 24.sc,
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: onBackButtonPressed,
                    icon: const Icon(FluentIcons.arrow_left_24_filled),
                  ),
                if (this.leadingActions.isNotEmpty) ...this.leadingActions,
                if (this.title != null)
                  Text(
                    this.title!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                const Spacer(),
                if (this.trailingActions.isNotEmpty) ...this.trailingActions,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
