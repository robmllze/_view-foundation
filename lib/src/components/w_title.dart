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

class WTitle extends StatelessWidget {
  //
  //
  //

  final String? titleText;
  final Widget? title;
  final TextStyleFromTheme? style;
  final Widget? child;
  final double? spacing;

  //
  //
  //

  const WTitle({
    super.key,
    this.titleText,
    this.title,
    this.style,
    this.spacing,
    this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final hasTitleText = this.titleText?.isNotEmpty == true;
    final hasTitle = this.title != null;
    return WColumn(
      divider: SizedBox(height: this.spacing ?? 8.sc),
      children: [
        if (hasTitleText || hasTitle) ...[
          DefaultTextStyle(
            style: this.style?.of(context) ??
                Theme.of(context).textTheme.labelMedium?.wSemiBold ??
                const TextStyle(),
            child: hasTitleText
                ? Text(
                    this.titleText!,
                  )
                : this.title!,
          ),
        ],
        if (this.child != null) this.child!,
      ],
    );
  }
}
