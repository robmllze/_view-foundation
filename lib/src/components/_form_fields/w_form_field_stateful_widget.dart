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

abstract class WFormFieldStatefulWidget<T> extends StatefulWidget {
  //
  //
  //

  final String? title;
  final bool? readOnly;
  final bool? enabled;
  final String? Function(T? data)? validator;
  final AutovalidateMode? autovalidateMode;
  final void Function(T? data)? onAutoSave;
  final Duration? autosaveDelay;

  //
  //
  //

  const WFormFieldStatefulWidget({
    super.key,
    this.title,
    this.readOnly,
    this.enabled,
    this.validator,
    this.autovalidateMode,
    this.onAutoSave,
    this.autosaveDelay,
  });

  //
  //
  //

  @override
  WFormFieldStatefulWidgetState<T, WFormFieldStatefulWidget<T>> createState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract class WFormFieldStatefulWidgetState<T, W extends WFormFieldStatefulWidget<T>>
    extends State<W> {
  //
  //
  //

  late final autosaveDebouncer = Debouncer(
    delay: this.widget.autosaveDelay ?? const Duration(seconds: 5),
    onWaited: () {
      final shapshot = this.getSnapshot();
      final valid = validatorWithDefault(shapshot) == null;
      this.widget.onAutoSave?.call(valid ? shapshot : null);
    },
  );

  //
  //
  //

  T? getSnapshot();

  //
  //
  //

  String? validatorWithDefault(T? snapshot) {
    if (this.widget.validator != null) {
      return this.widget.validator?.call(snapshot);
    } else {
      return snapshot == null || snapshot.toString().isEmpty ? '***' : null;
    }
  }

  //
  //
  //

  @override
  void dispose() {
    this.autosaveDebouncer.finalize();
    super.dispose();
  }
}
