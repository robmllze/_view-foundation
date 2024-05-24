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

class WPanel extends StatefulWidget {
  //
  //
  //

  final String? title;
  final List<Widget?>? children;
  final bool? collapsed;

  //
  //
  //

  const WPanel({
    super.key,
    this.title,
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

class _State extends State<WPanel> {
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return PodWidget(
      initialValue: this.widget.collapsed ?? false,
      builder: (context, child, pCollapsed) {
        return WSurface(
          borderRadius: BorderRadius.circular(8.sc),
          padding: EdgeInsets.all(16.sc),
          color: Theme.of(context).colorScheme.surface,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              width: 1.sc,
            ),
          ),
          child: WColumn(
            children: [
              WRow(
                crossAxisAlignment: CrossAxisAlignment.center,
                divider: const Spacer(),
                children: [
                  WInkWell(
                    onTapDown: this.widget.collapsed != null
                        ? (details) {
                            pCollapsed.update((e) => !e);
                          }
                        : null,
                    child: Text(
                      this.widget.title!,
                      style: Theme.of(context).textTheme.titleSmall,
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
              WDivider(size: 20.sc),
              WCollapsable(
                collapsed: pCollapsed.value,
                duration: const Duration(milliseconds: 200),
                child: WColumn(
                  firstIfNotEmpty: SizedBox(height: 16.sc),
                  lastIfNotEmpty: SizedBox(height: 16.sc),
                  divider: SizedBox(height: 16.sc),
                  children: this.widget.children,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
