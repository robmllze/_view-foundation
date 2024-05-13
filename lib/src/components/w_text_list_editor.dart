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

class WTextListEditor extends StatefulWidget {
  //
  //
  //

  final String labelText;
  final Iterable<String> initialItems;
  final Function(List<String>, String, int)? onAdd;
  final Function(List<String>, String, int)? onRemove;
  final Future<Widget> Function(BuildContext, String)? titleBuilder;

  //
  //
  //

  const WTextListEditor({
    super.key,
    this.labelText = '',
    this.initialItems = const [],
    this.onAdd,
    this.onRemove,
    this.titleBuilder,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WTextListEditor> {
  //
  //
  //

  late final _items = <String>[...this.widget.initialItems];
  final _textController = TextEditingController();

  //
  //
  //

  void _addText() {
    final value = _textController.text;
    if (value.isNotEmpty) {
      this.setState(() {
        this._items.add(value);
        this._textController.clear();
      });
      this.widget.onAdd?.call(_items, value, _items.length - 1);
    }
  }

  //
  //
  //

  void _removeText(int index) {
    final value = this._items[index];
    this.setState(() {
      this._items.removeAt(index);
    });
    this.widget.onRemove?.call(_items, value, index);
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: this._textController,
          decoration: InputDecoration(
            labelText: this.widget.labelText,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.sc),
              child: IconButton(
                icon: const Icon(FluentIcons.add_16_regular),
                onPressed: this._addText,
              ),
            ),
          ),
          onSubmitted: (_) => this._addText(),
        ),
        if (this._items.isNotEmpty) SizedBox(height: 8.sc),
        ...this._items.mapi(
          (text, index, _) {
            final item = this._items[index];
            return ListTile(
              title: FutureBuilder(
                future: this.widget.titleBuilder?.call(context, item),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data ?? Text(item);
                  }
                  return const SizedBox();
                },
              ),
              trailing: IconButton(
                icon: const Icon(FluentIcons.delete_16_regular),
                onPressed: () => this._removeText(index),
              ),
            );
          },
        ),
      ],
    );
  }

  //
  //
  //

  @override
  void dispose() {
    this._textController.dispose();
    super.dispose();
  }
}
