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

// class WDefaultTextField extends StatefulWidget {
//   //
//   //
//   //

//   final void Function(String? text)? onAfterChanged;
//   final TextEditingController? controller;
//   final Duration debouncerDelay;
//   final bool readOnly;
//   final String title;
//   final String? Function(String? text)? validator;

//   //
//   //
//   //

//   const WDefaultTextField({
//     super.key,
//     this.onAfterChanged,
//     this.controller,
//     this.debouncerDelay = const Duration(seconds: 5),
//     this.readOnly = false,
//     this.title = '',
//     this.validator,
//   });

//   //
//   //
//   //

//   @override
//   State<WDefaultTextField> createState() => _State();
// }

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class _State extends State<WDefaultTextField> {
//   //
//   //
//   //

//   late final _didProvideController = this.widget.controller != null;

//   late final _controller = this.widget.controller ?? TextEditingController();

//   late final changeDebouncer = Debouncer(
//     delay: this.widget.debouncerDelay,
//     onWaited: () {
//       final valid = this._isValid(this._controller.text) == null;
//       this.widget.onAfterChanged?.call(valid ? this._controller.text : null);
//     },
//   );

//   late final _isValid = this.widget.validator ?? (e) => e == null || e.isEmpty ? '***' : null;

//   //
//   //
//   //

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (this.widget.title.isNotEmpty) ...[
//           Text(
//             this.widget.title,
//             style: Theme.of(context).textTheme.titleMedium?.wSemiBold,
//           ),
//           SizedBox(height: 6.sc),
//         ],
//         TextFormField(
//           controller: this._controller,
//           autovalidateMode: AutovalidateMode.always,
//           readOnly: this.widget.readOnly,
//           onChanged: (_) => this.changeDebouncer(),
//           validator: this.widget.validator,
//         ),
//       ],
//     );
//   }

//   //
//   //
//   //

//   @override
//   void dispose() {
//     this.changeDebouncer.finalize();
//     if (!this._didProvideController) {
//       this._controller.dispose();
//     }
//     super.dispose();
//   }
// }
