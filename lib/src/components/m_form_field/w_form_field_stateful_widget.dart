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
  final Future<void> Function(T data)? onAutoSubmit;
  final Duration? autoSubmitDelay;

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
    this.onAutoSubmit,
    this.autoSubmitDelay,
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

  final pIsAutoSubmitting = Pod<bool>(false);

  //
  //
  //

  late final autoSubmitDebouncer = Debouncer(
    delay: this.widget.autoSubmitDelay ?? const Duration(milliseconds: 1500),
    onCall: () async {
      await this.pIsAutoSubmitting.set(true);
    },
    onWaited: () async {
      final valid = this.validate();
      if (valid == null || valid) {
        await this.widget.onAutoSubmit?.call(this.getSnapshot());
      }
      await this.pIsAutoSubmitting.set(false);
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
      await this.autoSubmitDebouncer.finalize();
      this.pIsAutoSubmitting.dispose();
    }();
    super.dispose();
  }
}
