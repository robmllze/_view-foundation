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

class WTextFormField extends WFormFieldStatefulWidget<String> {
  //
  //
  //

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final bool? autocomplete;
  final void Function(String text)? onFieldSubmitted;

  //
  //
  //

  const WTextFormField({
    super.key,
    super.title,
    super.readOnly,
    super.enabled,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onAutoSave,
    super.autosaveDelay,
    this.controller,
    this.decoration,
    this.focusNode,
    this.keyboardType,
    this.autofillHints,
    this.minLines,
    this.maxLines = 1,
    this.obscureText,
    this.textInputAction,
    this.autocomplete,
    this.onFieldSubmitted,
  });

  //
  //
  //

  WTextFormField copyWith({
    TextEditingController? controller,
    InputDecoration? decoration,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    Iterable<String>? autofillHints,
    int? minLines,
    int? maxLines,
    bool? obscureText,
    String? title,
    bool? readOnly,
    bool? enabled,
    String? Function(String?)? validator,
    AutovalidateMode? autovalidateMode,
    final void Function(String? text)? onAutoSave,
    Duration? autosaveDelay,
    TextInputAction? textInputAction,
    void Function(String text)? onFieldSubmitted,
  }) {
    return WTextFormField(
      key: key,
      title: title ?? this.title,
      readOnly: readOnly ?? this.readOnly,
      enabled: enabled ?? this.enabled,
      validator: validator ?? this.validator,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      onAutoSave: onAutoSave ?? this.onAutoSave,
      autosaveDelay: autosaveDelay ?? this.autosaveDelay,
      controller: controller ?? this.controller,
      decoration: decoration ?? this.decoration,
      focusNode: focusNode ?? this.focusNode,
      keyboardType: keyboardType ?? this.keyboardType,
      autofillHints: autofillHints ?? this.autofillHints,
      minLines: minLines ?? this.minLines,
      maxLines: maxLines ?? this.maxLines,
      obscureText: obscureText ?? this.obscureText,
      textInputAction: textInputAction ?? this.textInputAction,
      onFieldSubmitted: onFieldSubmitted ?? this.onFieldSubmitted,
    );
  }

  //
  //
  //

  @override
  WTextFormFieldState createState() => WTextFormFieldState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class WTextFormFieldState extends WFormFieldStatefulWidgetState<String, WTextFormField> {
  //
  //
  //

  late final _didProvideController = this.widget.controller != null;
  late final xController = this.widget.controller ?? TextEditingController();
  late final _didProvideFocusNode = this.widget.focusNode != null;
  late final xFocusNode = this.widget.focusNode ?? FocusNode();

  //
  //
  //

  @override
  String? getSnapshot() => this.xController.text;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (this.widget.title?.isNotEmpty == true) ...[
          Text(
            this.widget.title!,
            style: Theme.of(context).textTheme.labelLarge?.wSemiBold,
          ),
          SizedBox(height: 6.sc),
        ],
        TextFormField(
          autofocus: true,
          autovalidateMode: this.widget.autovalidateMode,
          controller: this.xController,
          decoration: this.widget.decoration,
          enabled: this.widget.enabled,
          focusNode: this.xFocusNode,
          keyboardType: this.widget.keyboardType,
          onChanged: (_) => this.autosaveDebouncer(),
          readOnly: this.widget.readOnly ?? false,
          validator: this.validatorWithDefault,
          minLines: this.widget.minLines,
          maxLines: this.widget.maxLines,
          autofillHints: this.widget.autofillHints,
          obscureText: this.widget.obscureText ?? false,
          textInputAction: this.widget.textInputAction,
          onFieldSubmitted: this.widget.onFieldSubmitted,
          cursorWidth: 2.sc,
          scrollPadding: EdgeInsets.all(20.sc),
        ),
      ],
    );
  }

  //
  //
  //

  @override
  void dispose() {
    super.dispose();
    if (!this._didProvideController) {
      this.xController.dispose();
    }
    if (!this._didProvideFocusNode) {
      this.xFocusNode.dispose();
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension WTextFormFieldExtension on WTextFormField {
  //
  //
  //

  WTextFormField toNameField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
      validator: (e) {
        return e != null
            ? e.isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  //
  //
  //

  WTextFormField toEmailField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      validator: (e) {
        return e != null
            ? RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(e)
                ? null
                : errorText
            : null;
      },
    );
  }

  //
  //
  //

  WTextFormField toPasswordField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      validator: (e) {
        return e != null
            ? e.length >= 8
                ? null
                : errorText
            : null;
      },
      obscureText: this.obscureText ?? true,
    );
  }

  WTextFormField toNewPasswordField({String errorText = '***'}) {
    return this.toPasswordField(errorText: errorText).copyWith(
      autofillHints: const [AutofillHints.newPassword],
    );
  }

  //
  //
  //

  WTextFormField toMultiline3To5Field() {
    return this.copyWith(
      keyboardType: TextInputType.multiline,
      minLines: 3,
      maxLines: 5,
    );
  }

  //
  //
  //

  WTextFormField toPhoneNumberField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.phone,
      autofillHints: const [AutofillHints.telephoneNumber],
      validator: (e) {
        return e != null
            ? RegExp(r'^[0-9]{10}$').hasMatch(e)
                ? null
                : errorText
            : null;
      },
    );
  }

  //
  //
  //

  WTextFormField asNumber({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.number,
      validator: (e) {
        return e != null
            ? RegExp(r'^[0-9]*$').hasMatch(e)
                ? null
                : errorText
            : null;
      },
    );
  }

  //
  //
  //

  WTextFormField toBirthdayField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.datetime,
      autofillHints: const [AutofillHints.birthday],
      validator: (e) {
        return e != null
            ? e.isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  //
  //
  //

  WTextFormField toAddressLine1Field({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.streetAddress,
      autofillHints: const [AutofillHints.streetAddressLine1],
      validator: (e) {
        return e != null
            ? e.isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  WTextFormField toAddressLine2Field({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.streetAddress,
      autofillHints: const [AutofillHints.streetAddressLine2],
      validator: (e) {
        return e != null
            ? e.isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  WTextFormField toAddressCityField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.text,
      autofillHints: const [AutofillHints.addressCity],
      validator: (e) {
        return e != null
            ? e.isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  WTextFormField toAddressStateField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.text,
      autofillHints: const [AutofillHints.addressState],
      validator: (e) {
        return e != null
            ? e.isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  WTextFormField toAddressPostalCodeField({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.number,
      autofillHints: const [AutofillHints.postalCode],
      validator: (e) {
        return e != null
            ? RegExp(r'^[0-9]{6}$').hasMatch(e)
                ? null
                : errorText
            : null;
      },
    );
  }
}
