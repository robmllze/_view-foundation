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

class WConfirmationDialog extends StatefulWidget {
  //
  //
  //

  final String? title;
  final String? body;
  final String? confirmText;
  final String? denyText;
  final void Function()? onConfirm;
  final void Function()? onDeny;
  final ButtonStyle? confirmButtonStyle;
  final ButtonStyle? denyButtonStyle;
  final Widget? child;

  //
  //
  //

  const WConfirmationDialog({
    super.key,
    this.title,
    this.body,
    this.confirmText,
    this.denyText,
    this.onConfirm,
    this.onDeny,
    this.confirmButtonStyle,
    this.denyButtonStyle,
    this.child,
  });

  //
  //
  //

  WConfirmationDialog copyWith({
    String? title,
    String? body,
    String? confirmText,
    String? denyText,
    void Function()? onConfirm,
    void Function()? onDeny,
    ButtonStyle? confirmButtonStyle,
    ButtonStyle? denyButtonStyle,
    Widget? child,
  }) {
    return WConfirmationDialog(
      title: title ?? this.title,
      body: body ?? this.body,
      confirmText: confirmText ?? this.confirmText,
      denyText: denyText ?? this.denyText,
      onConfirm: onConfirm ?? this.onConfirm,
      onDeny: onDeny ?? this.onDeny,
      confirmButtonStyle: confirmButtonStyle ?? this.confirmButtonStyle,
      denyButtonStyle: denyButtonStyle ?? this.denyButtonStyle,
      child: child ?? this.child,
    );
  }

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<WConfirmationDialog> {
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
          WDefaultDialogBody(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (this.widget.title != null) ...[
                  Text(
                    this.widget.title!,
                    style: Theme.of(context).textTheme.titleMedium?.wBold,
                  ),
                  SizedBox(height: 12.sc),
                ],
                if (this.widget.body != null) ...[
                  Text(
                    this.widget.body!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 12.sc),
                ],
                if (this.widget.child != null) ...[
                  this.widget.child!,
                  SizedBox(height: 12.sc),
                ],
                Padding(
                  padding: EdgeInsets.only(top: 12.sc),
                  child: WRow(
                    divider: SizedBox(width: 12.sc),
                    children: [
                      if (this.widget.onConfirm != null && this.widget.confirmText != null)
                        FilledButton(
                          onPressed: this.widget.onConfirm,
                          style: this.widget.confirmButtonStyle,
                          child: Text(this.widget.confirmText!),
                        ),
                      if (this.widget.onDeny != null && this.widget.denyText != null)
                        TextButton(
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

extension ShowDialogOnWConfirmationDialogExtension on WConfirmationDialog {
  //
  //
  //

  Future<void> showDialog({
    required BuildContext context,
    Future<void> Function()? onConfrm,
  }) async {
    await showOverlay(
      context,
      builder: (tempContext, remove) {
        return this.copyWith(
          onDeny: remove,
          onConfirm: onConfrm,
        );
      },
    );
  }

  //
  //
  //

  Future<void> showDialogWithTextField({
    required BuildContext context,
    required Future<void> Function(String password) onDelete,
  }) async {
    final controller = TextEditingController();
    await showOverlay(
      context,
      builder: (tempContext, r1) {
        Future<void> onConfirm() async {
          r1();
          late void Function() r2;

          showAppIconOverlay(context, remover: (r) => r2 = r);
          try {
            await onDelete(controller.text);
            r2();
          } catch (e) {
            r2();
            showMessageToastOverlay(
              context,
              message: e,
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
            );
          }
        }

        return this.copyWith(
          onDeny: r1,
          onConfirm: onConfirm,
          child: WTextFormField(
            controller: controller,
            onFieldSubmitted: (_) => onConfirm(),
          ).withPasswordProps().withObscurityToggle(),
        );
      },
    );
    controller.dispose();
  }
}
