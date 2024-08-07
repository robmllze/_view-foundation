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

class MPanel extends StatefulWidget {
  //
  //
  //

  final String? titleText;
  final Widget? title;
  final TextStyleFromTheme? titleStyle;
  final List<Widget?>? children;
  final bool? collapsed;

  //
  //
  //

  const MPanel({
    super.key,
    this.titleText,
    this.title,
    this.titleStyle,
    this.children,
    this.collapsed,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<MPanel> {
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final hasTitleText = this.widget.titleText?.isNotEmpty == true;
    final hasTitleWidget = this.widget.title != null;
    final hatTitle = hasTitleText || hasTitleWidget;
    final hasHeader = hatTitle || this.widget.collapsed != null;
    return PodWidget(
      initialValue: this.widget.collapsed ?? false,
      builder: (context, child, pCollapsed) {
        return MSurface(
          borderRadius: BorderRadius.circular(8.sc),
          color: Theme.of(context).colorScheme.surface,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              width: 1.sc,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.sc),
            child: WColumn(
              divider: MDivider(size: 20.sc),
              children: [
                if (hasHeader)
                  WRow(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    divider: const Spacer(),
                    children: [
                      if (hasTitleText || hasTitleWidget)
                        MInkWell(
                          onTapDown: this.widget.collapsed != null
                              ? () {
                                  pCollapsed.update((e) => !e);
                                }
                              : null,
                          child: DefaultTextStyle(
                            style: this.widget.titleStyle?.of(context) ??
                                Theme.of(context).textTheme.titleSmall ??
                                const TextStyle(),
                            child: hasTitleText
                                ? Text(
                                    this.widget.titleText!,
                                  )
                                : this.widget.title!,
                          ),
                        ),
                      if (this.widget.collapsed != null)
                        IconButton(
                          icon: Icon(
                            pCollapsed.value
                                ? FluentIcons.panel_bottom_contract_20_regular
                                : FluentIcons.panel_bottom_expand_20_regular,
                            size: 24.sc,
                          ),
                          onPressed: () => pCollapsed.update((e) => !e),
                        ),
                    ],
                  ),
                WCollapsable(
                  collapsed: pCollapsed.value,
                  duration: const Duration(milliseconds: 200),
                  child: WColumn(
                    firstIfNotEmpty: SizedBox(height: 12.sc),
                    lastIfNotEmpty: SizedBox(height: 12.sc),
                    divider: SizedBox(height: 32.sc),
                    children: this.widget.children,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
