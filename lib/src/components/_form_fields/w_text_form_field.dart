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
    // Super.
    super.key,
    super.defaultValue,
    super.title,
    super.readOnly,
    super.enabled,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onAutoSave,
    super.autosaveDelay,
    // This.
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
    // Super.
    Key? key,
    String? defaultValue,
    String? title,
    bool? readOnly,
    bool? enabled,
    String? Function(String?)? validator,
    AutovalidateMode? autovalidateMode,
    Future<void> Function(String)? onAutoSave,
    Duration? autosaveDelay,
    // This.
    TextEditingController? controller,
    InputDecoration? decoration,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    Iterable<String>? autofillHints,
    int? minLines,
    int? maxLines,
    bool? obscureText,
    TextInputAction? textInputAction,
    bool? autocomplete,
    void Function(String text)? onFieldSubmitted,
  }) {
    return WTextFormField(
      // Super.
      key: key ?? this.key,
      defaultValue: defaultValue ?? this.defaultValue,
      title: title ?? this.title,
      readOnly: readOnly ?? this.readOnly,
      enabled: enabled ?? this.enabled,
      validator: validator ?? this.validator,
      autovalidateMode: autovalidateMode ?? this.autovalidateMode,
      onAutoSave: onAutoSave ?? this.onAutoSave,
      autosaveDelay: autosaveDelay ?? this.autosaveDelay,
      // This.
      controller: controller ?? this.controller,
      decoration: decoration ?? this.decoration,
      focusNode: focusNode ?? this.focusNode,
      keyboardType: keyboardType ?? this.keyboardType,
      autofillHints: autofillHints ?? this.autofillHints,
      minLines: minLines ?? this.minLines,
      maxLines: maxLines ?? this.maxLines,
      obscureText: obscureText ?? this.obscureText,
      textInputAction: textInputAction ?? this.textInputAction,
      autocomplete: autocomplete ?? this.autocomplete,
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

  final formFieldStateKey = GlobalKey<FormFieldState>();
  late final _didProvideController = this.widget.controller != null;
  late final controllerOrDefault = this.widget.controller ?? TextEditingController();
  late final _didProvideFocusNode = this.widget.focusNode != null;
  late final focusNodeOrDefault = this.widget.focusNode ?? FocusNode();

  //
  //
  //

  @override
  void initState() {
    if (this.widget.defaultValue != null) {
      this.controllerOrDefault.text = this.widget.defaultValue!;
    }
    super.initState();
  }

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
          // Super.
          key: this.formFieldStateKey,
          readOnly: this.widget.readOnly ?? false,
          enabled: this.widget.enabled ?? true,
          validator: this.validatorOrDefault,
          autovalidateMode: this.widget.autovalidateMode,
          onSaved: (e) => this.autosaveDebouncer(),
          // This.
          controller: this.controllerOrDefault,
          decoration: this._defaultOrReadOnlyDecoration(),
          focusNode: this.focusNodeOrDefault,
          keyboardType: this.widget.keyboardType,
          autofillHints: this.widget.autofillHints,
          minLines: this.widget.minLines,
          maxLines: this.widget.maxLines,
          obscureText: this.widget.obscureText ?? false,
          textInputAction: this.widget.textInputAction,
          onFieldSubmitted: this.widget.onFieldSubmitted,
          // Other.
          autofocus: true,
          onChanged: (_) => this.autosaveDebouncer(),
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
  String getSnapshot() => this.controllerOrDefault.text;

  //
  //
  //

  @override
  bool? validate() => this.formFieldStateKey.currentState?.validate();

  //
  //
  //

  InputDecoration? _defaultOrReadOnlyDecoration() {
    if (this.widget.readOnly != null && this.widget.readOnly!) {
      return (this.widget.decoration ?? const InputDecoration()).copyWith(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
      );
    } else {
      return this.widget.decoration;
    }
  }

  //
  //
  //

  @override
  void dispose() {
    super.dispose();
    if (!this._didProvideController) {
      this.controllerOrDefault.dispose();
    }
    if (!this._didProvideFocusNode) {
      this.focusNodeOrDefault.dispose();
    }
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

extension WTextFormFieldVariationsExtension on WTextFormField {
  //
  //
  //

  WTextFormField withNameProps({String errorText = '***'}) {
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

  WTextFormField withEmailProps({String errorText = '***'}) {
    return this.copyWith(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.username,
      ],
      validator: (e) {
        return e != null
            ? RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(e)
                ? null
                : errorText
            : null;
      },
    );
  }

  WTextFormField withNewEmailProps({String errorText = '***'}) {
    return this.withEmailProps(errorText: errorText).copyWith(
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.newUsername,
      ],
    );
  }

  WTextFormField withPasswordProps({String errorText = '***'}) {
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

  WTextFormField withNewPasswordProps({String errorText = '***'}) {
    return this.withPasswordProps(errorText: errorText).copyWith(
      autofillHints: const [AutofillHints.newPassword],
    );
  }

  Widget withObscurityToggle() {
    return PodWidget(
      initialValue: true,
      builder: (context, child, pObscureText) {
        final obscureText = pObscureText.value;
        return this.copyWith(
          obscureText: obscureText,
          decoration: (this.decoration ?? const InputDecoration()).copyWith(
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.sc),
              child: IconButton(
                icon: Icon(
                  obscureText ? FluentIcons.eye_16_filled : FluentIcons.eye_off_16_filled,
                ),
                onPressed: () => pObscureText.update((v) => !v),
              ),
            ),
          ),
        );
      },
    );
  }

  WTextFormField withMultilineProps({
    int? minLines = 3,
    int? maxLines = 5,
    String errorText = '***',
  }) {
    return this.copyWith(
      keyboardType: TextInputType.multiline,
      minLines: minLines,
      maxLines: maxLines,
      validator: (e) {
        return e != null
            ? e.isNotEmpty
                ? null
                : errorText
            : null;
      },
    );
  }

  WTextFormField withPhoneNumberProps({String errorText = '***'}) {
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

  WTextFormField withNumberProps({String errorText = '***'}) {
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

  WTextFormField withBirthdayProps({String errorText = '***'}) {
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

  WTextFormField withAddressLine1Props({String errorText = '***'}) {
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

  WTextFormField withAddressLine2Props({String errorText = '***'}) {
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

  WTextFormField withAddressCityProps({String errorText = '***'}) {
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

  WTextFormField withAddressStateProps({String errorText = '***'}) {
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

  WTextFormField withAddressPostalCodeProps({String errorText = '***'}) {
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
