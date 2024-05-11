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

class MyDefaultListTile extends StatelessWidget {
  //
  //
  //

  final List<Widget> leading;
  final String title;
  final String subtitle;
  final String description;
  final Iterable<String> tags;
  final Iterable<WTagMakeup> tagMakeups;
  final Widget? icon;
  final void Function()? onTap;
  final void Function()? onTapIcon;
  final List<Widget> trailing;

  //
  //
  //

  const MyDefaultListTile({
    super.key,
    this.leading = const [],
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.tags = const [],
    this.tagMakeups = const [],
    this.icon,
    this.onTap,
    this.onTapIcon,
    this.trailing = const [],
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.sc),
      onTap: this.onTap,
      child: Padding(
        padding: EdgeInsets.all(8.sc),
        child: WRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          divider: SizedBox(width: 8.sc),
          children: [
            ...this.leading,
            Expanded(
              child: WColumn(
                children: [
                  Wrap(
                    children: [
                      if (this.title.isNotEmpty)
                        Text(
                          this.title,
                          style: Theme.of(context).textTheme.bodyLarge?.wBold,
                        ),
                      if (tags.isNotEmpty) ...[
                        SizedBox(width: 8.sc),
                        Wrap(
                          spacing: 4.sc,
                          runSpacing: 4.sc,
                          children: [
                            ...this.tags.mapi(
                              (text, i, _) {
                                var makeup = this.tagMakeups.elementAtOrNull(i);
                                var n = i - 1;
                                while (makeup == null || n > 0) {
                                  makeup = this.tagMakeups.elementAtOrNull(n--);
                                }
                                return WTag(text: text, makeup: makeup);
                              },
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  if (this.subtitle.isNotEmpty) ...[
                    SizedBox(height: 2.sc),
                    Text(
                      this.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.wMedium,
                    ),
                  ],
                  if (this.description.isNotEmpty) ...[
                    SizedBox(height: 4.sc),
                    Text(
                      this.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
            ...this.trailing,
            if (this.icon != null)
              IconButton(
                icon: this.icon!,
                iconSize: 24.sc,
                onPressed: this.onTapIcon ?? this.onTap,
              ),
          ],
        ),
      ),
    );
  }
}
