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

  final String title;
  final String subtitle;
  final String description;
  final Iterable<String> tags;
  final Iterable<WTagMakeup> tagMakeups;
  final void Function()? onTap;
  final List<Widget> leading;
  final Widget? leadingIcon;
  final void Function()? onTapLeadingIcon;
  final List<Widget> trailing;
  final Widget? trailingIcon;
  final void Function()? onTapTrailingIcon;

  //
  //
  //

  const MyDefaultListTile({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.description = '',
    this.tags = const [],
    this.tagMakeups = const [],
    this.onTap,
    this.leading = const [],
    this.leadingIcon,
    this.onTapLeadingIcon,
    this.trailing = const [],
    this.trailingIcon,
    this.onTapTrailingIcon,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.sc),
        onTap: this.onTap,
        // SizedBod needed for InkWell splash effect.
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.all(4.sc),
            child: SizedBox(
              child: WRow(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                divider: SizedBox(width: 8.sc),
                children: [
                  if (this.leadingIcon != null)
                    IconButton(
                      icon: this.leadingIcon!,
                      iconSize: 24.sc,
                      onPressed: this.onTapLeadingIcon ?? this.onTap,
                    ),
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
                                spacing: 8.sc,
                                runSpacing: 8.sc,
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
                  if (this.trailingIcon != null)
                    IconButton(
                      icon: this.trailingIcon!,
                      iconSize: 24.sc,
                      onPressed: this.onTapTrailingIcon ?? this.onTap,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
