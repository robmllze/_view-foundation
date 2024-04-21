//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:flutter/material.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyHeader extends StatelessWidget {
  //
  //
  //

  final String? title;
  final String? subtitle;
  final String? description;
  final List<Widget> leadingActions;
  final List<Widget> trailingActions;
  final Widget? breadCrumbBar;
  final void Function()? onBackButtonPressed;

  //
  //
  //

  const MyHeader({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.leadingActions = const [],
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
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.sc,
              horizontal: 12.sc,
            ),
            child: PodWidget(
              builder: (context, child, pod) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      spacing: 4.sc,
                      runSpacing: 4.sc,
                      children: [
                        if (this.onBackButtonPressed != null)
                          SizedBox(
                            width: 40.sc,
                            child: IconButton(
                              onPressed: onBackButtonPressed,
                              icon: Icon(
                                FluentIcons.arrow_left_24_filled,
                                color: Theme.of(context).colorScheme.primary,
                                size: 24.sc,
                              ),
                            ),
                          ),
                        SizedBox(width: 4.sc),
                        WColumn(
                          children: [
                            if (this.title != null && this.title!.isNotEmpty)
                              Text(
                                this.title!,
                                style: Theme.of(context).textTheme.titleMedium?.wBold,
                              ),
                            if (this.subtitle != null && this.subtitle!.isNotEmpty) ...[
                              SizedBox(height: 2.sc),
                              Text(
                                this.subtitle!,
                                style: Theme.of(context).textTheme.bodyMedium?.wMedium,
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
                        if (this.leadingActions.isNotEmpty) ...this.leadingActions,
                      ],
                    ),
                    SizedBox(width: 8.sc),
                    Flexible(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.end,
                        spacing: 4.sc,
                        runSpacing: 4.sc,
                        children: [
                          if (this.trailingActions.isNotEmpty) ...this.trailingActions,
                        ],
                      ),
                    ),
                  ],
                );
              },
              initialValue: 0.0,
            ),
          ),
        ),
      ],
    );
  }
}
