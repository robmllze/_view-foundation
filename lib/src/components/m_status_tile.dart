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

class MStatusTile<TEnum extends Enum> extends StatelessWidget {
  //
  //
  //

  final TEnum status;
  final Map<TEnum, Widget> icons;
  final Map<TEnum, BoxDecoration> decorations;
  final Map<TEnum, Widget> messages;

  //
  //
  //

  const MStatusTile({
    super.key,
    required this.status,
    this.icons = const {},
    this.decorations = const {},
    this.messages = const {},
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return MSurface(
      borderRadius: BorderRadius.circular(8.sc),
      color: Theme.of(context).colorScheme.surface,
      decoration: decorations[status] ??
          BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              width: 1.sc,
            ),
          ),
      child: Padding(
        padding: EdgeInsets.all(12.sc),
        child: WRow(
          crossAxisAlignment: CrossAxisAlignment.center,
          divider: SizedBox(width: 8.sc),
          children: [
            icons[status] ?? const SizedBox.shrink(),
            Expanded(
              child: messages[status] ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

enum WStatusTileBoolean {
  //
  //
  //

  TRUE(true),
  FALSE(false),
  NULL(null);

  //
  //
  //

  final bool? value;

  //
  //
  //

  const WStatusTileBoolean(this.value);
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension ToWStatusTileBooleanOnBoolExtension on bool? {
  WStatusTileBoolean get toWStatusTileBoolean {
    if (this == true) {
      return WStatusTileBoolean.TRUE;
    } else if (this == false) {
      return WStatusTileBoolean.FALSE;
    } else {
      return WStatusTileBoolean.NULL;
    }
  }
}
