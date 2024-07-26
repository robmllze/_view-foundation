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

class MConfirmationDialog extends StatefulWidget {
  //
  //
  //

  final String? title;
  final String? message;
  final String? confirmText;
  final String? denyText;
  final FutureOr<void> Function(String text)? onConfirm;
  final void Function()? onDeny;
  final ButtonStyle? confirmButtonStyle;
  final ButtonStyle? denyButtonStyle;
  final MTextFormField? textField;
  final Widget? child;

  //
  //
  //

  const MConfirmationDialog({
    super.key,
    this.title,
    this.message,
    this.confirmText,
    this.denyText,
    this.onConfirm,
    this.onDeny,
    this.confirmButtonStyle,
    this.denyButtonStyle,
    this.textField,
    this.child,
  });

  //
  //
  //

  MConfirmationDialog copyWith({
    String? title,
    String? body,
    String? confirmText,
    String? denyText,
    void Function(String text)? onConfirm,
    void Function()? onDeny,
    ButtonStyle? confirmButtonStyle,
    ButtonStyle? denyButtonStyle,
    MTextFormField? textField,
    Widget? child,
  }) {
    return MConfirmationDialog(
      title: title ?? this.title,
      message: body ?? this.message,
      confirmText: confirmText ?? this.confirmText,
      denyText: denyText ?? this.denyText,
      onConfirm: onConfirm ?? this.onConfirm,
      onDeny: onDeny ?? this.onDeny,
      confirmButtonStyle: confirmButtonStyle ?? this.confirmButtonStyle,
      denyButtonStyle: denyButtonStyle ?? this.denyButtonStyle,
      textField: textField ?? this.textField,
      child: child ?? this.child,
    );
  }

  //
  //
  //

  @override
  MConfirmationDialogState createState() => MConfirmationDialogState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MConfirmationDialogState extends State<MConfirmationDialog> {
  //
  //
  //

  late final GlobalKey<WTextFormFieldState> textFieldGlobalKey;
  late final MTextFormField? _textField;
  late final Pod<bool> pCanConfirm;

  //
  //
  //

  @override
  void initState() {
    final temp = this.widget.textField;
    this.textFieldGlobalKey =
        letAs<GlobalKey<WTextFormFieldState>>(temp?.key) ?? GlobalKey<WTextFormFieldState>();
    this._textField = temp?.copyWith(
      key: this.textFieldGlobalKey,
      onFieldSubmitted: (text) {
        temp.onFieldSubmitted?.call(text);
        this.widget.onConfirm?.call(text);
      },
      onUpdated: (text, errorText) {
        temp.onUpdated?.call(text, errorText);
        this.pCanConfirm.set(errorText == null);
      },
      autovalidateMode: temp.autovalidateMode ?? AutovalidateMode.always,
    );
    this.pCanConfirm = Pod(this._isTextFieldInitiallyValid() ?? true);
    super.initState();
  }

  String _getBestTextFieldValue() {
    return this.textFieldGlobalKey.currentState?.controllerOrDefault.text ??
        this._textField?.controller?.text.nullIfEmpty ??
        this._textField?.defaultValue ??
        '';
  }

  bool? _isTextFieldInitiallyValid() {
    return this._textField?.validator?.call(this._getBestTextFieldValue()) == null;
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.sc),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          MDefaultDialogBody(
            child: IntrinsicWidth(
              child: WColumn(
                divider: SizedBox(height: 12.sc),
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (this.widget.title != null) ...[
                    Text(
                      this.widget.title!,
                      style: Theme.of(context).textTheme.titleMedium?.wBold,
                    ),
                    const MDivider(),
                  ],
                  if (this.widget.message != null)
                    Text(
                      this.widget.message!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  if (this._textField != null) this._textField,
                  if (this.widget.child != null) this.widget.child!,
                  Padding(
                    padding: EdgeInsets.only(top: 8.sc),
                    child: WRow(
                      divider: SizedBox(width: 12.sc),
                      children: [
                        if (this.widget.onConfirm != null && this.widget.confirmText != null)
                          PodBuilder(
                            pod: this.pCanConfirm,
                            builder: (context, child, canConfirm) {
                              return FilledButton(
                                onPressed: canConfirm == true
                                    ? () => this.widget.onConfirm!(this._getBestTextFieldValue())
                                    : null,
                                style: this.widget.confirmButtonStyle,
                                child: Text(this.widget.confirmText!),
                              );
                            },
                          ),
                        if (this.widget.onDeny != null && this.widget.denyText != null)
                          OutlinedButton(
                            onPressed: this.widget.onDeny,
                            style: this.widget.denyButtonStyle,
                            child: Text(this.widget.denyText!),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (this.widget.onDeny != null && this.widget.denyText == null)
            Padding(
              padding: EdgeInsets.all(8.sc),
              child: IconButton(
                onPressed: this.widget.onDeny,
                icon: Icon(
                  FluentIcons.dismiss_24_regular,
                  size: 24.sc,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

Future<void> showConfirmationDialog({
  required BuildContext context,
  required MConfirmationDialog dialog,
  void Function()? onSuccess,
  void Function(Object? e)? onError,
}) async {
  await showOverlay(
    context,
    builder: (_, r1) {
      Future<void> $onConfirm(String text) async {
        late void Function() r2;
        final c2 = Completer();
        showAppIconOverlay(
          context,
          remover: (r) {
            r2 = r;
            if (!c2.isCompleted) {
              c2.complete();
            }
          },
        );
        try {
          await dialog.onConfirm!(text);
          await c2.future;
          r2();
          onSuccess?.call();
        } catch (e) {
          await c2.future;
          r2();
          if (onError != null) {
            onError(e);
          } else {
            if (context.mounted) {
              showErrorToastOverlay(
                context,
                message: e,
              );
            }
          }
        }
      }

      return dialog.copyWith(
        onDeny: r1,
        onConfirm: (text) {
          r1();
          if (dialog.onConfirm != null) {
            $onConfirm(text);
          }
        },
      );
    },
  );
}
