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

class MyDeleteConfirmationDialog extends StatefulWidget {
  //
  //
  //

  final String initialValue;
  final void Function() onCancel;
  final Future<void> Function(String) onProceed;

  //
  //
  //

  const MyDeleteConfirmationDialog({
    super.key,
    this.initialValue = '',
    required this.onCancel,
    required this.onProceed,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<MyDeleteConfirmationDialog> {
  //
  //
  //

  late final _controller = TextEditingController(
    text: this.widget.initialValue,
  );

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return DialogBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delete Account||todo'.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.sc),
          Text(
            'Enter your password to delete your account||todo'.tr(),
          ),
          SizedBox(height: 12.sc),
          PodWidget(
            initialValue: true,
            builder: (context, child, pObscureText) {
              final obscureText = pObscureText.value;
              return TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
                obscureText: obscureText,
                controller: this._controller,
                onSubmitted: (_) => this._proceed(context),
              );
            },
          ),
          SizedBox(height: 20.sc),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: this.widget.onCancel,
                child: Text('Cancel||todo'.tr()),
              ),
              FilledButton(
                onPressed: () => this._proceed(context),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.error,
                  ),
                ),
                child: Text('Delete||todo'.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //
  //
  //

  Future<void> _proceed(BuildContext context) async {
    try {
      await this.widget.onProceed(this._controller.text);
      this.widget.onCancel();
    } catch (e) {
      if (context.mounted) {
        await showErrorToastOverlay(
          context,
          error: e,
          remover: removeInSeconds(3),
        );
      }
    }
  }

  //
  //
  //

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }
}
