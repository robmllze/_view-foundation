// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // 🇽🇾🇿 & Dev
// //
// // Licencing details are in the LICENSE file in the root directory.
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import '/_common.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class WTextListFormField extends WFormFieldStatefulWidget<String> {
//   //
//   //
//   //

//   final TextEditingController? controller;
//   final InputDecoration? decoration;
//   final Iterable<String> initialItems;
//   final FutureOr<void> Function(List<String> items, String added, int index)? onAddItem;
//   final FutureOr<void> Function(List<String> items, String removed, int index)? onRemoveItem;
//   final Future<Widget> Function(BuildContext context, String item)? itemBuilder;

//   //
//   //
//   //

//   const WTextListFormField({
//     super.key,
//     super.readOnly = false,
//     super.enabled = true,
//     super.validator,
//     super.autovalidateMode = AutovalidateMode.always,
//     this.initialItems = const [],
//     this.onAddItem,
//     this.onRemoveItem,
//     this.itemBuilder,
//     this.controller,
//     this.decoration,
//   });

//   //
//   //
//   //

//   @override
//   WTextListFormFieldState createState() => WTextListFormFieldState();
// }

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class WTextListFormFieldState extends WFormFieldStatefulWidgetState<String, WTextListFormField> {
//   //
//   //
//   //

//   late final _items = <String>[...this.widget.initialItems];

//   //
//   //
//   //

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         this._textFormField,
//         if (this._items.isNotEmpty) SizedBox(height: 8.sc),
//         ...this._items.mapi(
//           (text, index, _) {
//             final item = this._items[index];
//             return MDefaultListTile(
//               leading: [
//                 FutureBuilder(
//                   future: this.widget.itemBuilder?.call(context, item),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return snapshot.data ?? Text(item);
//                     }
//                     return const SizedBox.shrink();
//                   },
//                 ),
//               ],
//               trailing: [
//                 IconButton(
//                   icon: const Icon(FluentIcons.delete_16_regular),
//                   onPressed: () => this._removeItem(index),
//                 ),
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }

//   //
//   //
//   //

//   late final _textFormFieldKey = GlobalKey<WTextFormFieldState>();

//   late final _textFormField = WTextFormField(
//     key: this._textFormFieldKey,
//     readOnly: this.widget.readOnly,
//     enabled: this.widget.enabled,
//     validator: this.widget.validator,
//     controller: this.widget.controller,
//     decoration: (this.widget.decoration ?? const InputDecoration()).copyWith(
//       suffixIcon: Padding(
//         padding: EdgeInsets.only(right: 8.sc),
//         child: IconButton(
//           icon: const Icon(FluentIcons.add_16_regular),
//           onPressed: this._addItem,
//         ),
//       ),
//     ),
//   );

//   //
//   //
//   //

//   @override
//   String getSnapshot() => this._textFormFieldKey.currentState!.getSnapshot();

//   //
//   //
//   //

//   void _addItem() async {
//     final value = this.getSnapshot();
//     if (value.isNotEmpty) {
//       final valid = this.widget.validator?.call(value) == null;
//       if (valid) {
//         this.setState(() {
//           this._items.add(value);
//         });
//         await this.widget.onAddItem?.call(this._items, value, this._items.length - 1);
//         this._textFormFieldKey.currentState
//           ?..controllerOrDefault.clear()
//           ..focusNodeOrDefault.requestFocus();
//       }
//     }
//   }

//   //
//   //
//   //

//   void _removeItem(int index) async {
//     final value = this._items[index];
//     this.setState(() {
//       this._items.removeAt(index);
//     });
//     await this.widget.onRemoveItem?.call(this._items, value, index);
//   }
// }
