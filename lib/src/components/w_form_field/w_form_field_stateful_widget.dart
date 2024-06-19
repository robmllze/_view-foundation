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

  final T? defaultValue;
  final bool? readOnly;
  final bool? enabled;
  final String? Function(T? data)? validator;
  final AutovalidateMode? autovalidateMode;
  final Future<void> Function(T data)? onAutoSave;
  final Duration? autosaveDelay;

  //
  //
  //

  const WFormFieldStatefulWidget({
    super.key,
    this.defaultValue,
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

  final pIsAutosaving = Pod<bool>(false);

  //
  //
  //

  late final autosaveDebouncer = Debouncer(
    delay: this.widget.autosaveDelay ?? const Duration(milliseconds: 1500),
    onCall: () async {
      await this.pIsAutosaving.set(true);
    },
    onWaited: () async {
      final valid = this.validate();
      if (valid == null || valid) {
        await this.widget.onAutoSave?.call(this.getSnapshot());
      }
      await this.pIsAutosaving.set(false);
    },
  );

  //
  //
  //

  T getSnapshot();

  //
  //
  //

  String? validatorOrDefault(T? snapshot) {
    if (this.widget.validator != null) {
      return this.widget.validator?.call(snapshot);
    } else {
      return snapshot.toString().isEmpty ? '***' : null;
    }
  }

  //
  //
  //

  @visibleForOverriding
  bool? validate() {
    return this.validatorOrDefault(this.getSnapshot()) == null;
  }

  //
  //
  //

  @override
  void dispose() {
    () async {
      await this.autosaveDebouncer.finalize();
      this.pIsAutosaving.dispose();
    }();
    super.dispose();
  }
}
