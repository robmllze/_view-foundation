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

class WEmailResetDialogBody extends StatefulWidget {
  //
  //
  //

  final String initialValue;
  final void Function() onCancel;
  final Future<void> Function(String) onProceed;

  //
  //
  //

  const WEmailResetDialogBody({
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

class _State extends State<WEmailResetDialogBody> {
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
    return MDefaultDialogBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Password Reset||todo'.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.sc),
          Text(
            'Enter your email address to reset your password||todo'.tr(),
          ),
          SizedBox(height: 12.sc),
          TextField(
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email||todo'.tr(),
              border: const OutlineInputBorder(),
            ),
            controller: this._controller,
            onSubmitted: (_) => this._proceed(context),
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
                child: Text('Send||todo'.tr()),
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
      if (context.mounted) {
        showMessageToastOverlay(
          context,
          message:
              'An email has been sent to your email address {email}. Follow the link in the email to reset your password||todo'
                  .tr(args: {'email': this._controller.text}),
        );
      }
      this.widget.onCancel();
    } catch (e) {
      if (context.mounted) {
        showErrorToastOverlay(
          context,
          message: e,
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
