//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyEmailResetDialogBody extends StatelessWidget {
  //
  //
  //

  static const _trPrefix = 'screens.LoginScreen.MyEmailResetDialog';

  //
  //
  //

  final TextEditingController emailController;
  final void Function() onCancel;
  final Future<void> Function(String email) onSend;

  //
  //
  //

  const MyEmailResetDialogBody({
    super.key,
    required this.emailController,
    required this.onCancel,
    required this.onSend,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return MyDialogBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Password Reset||$_trPrefix.title'.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.sc),
          Text(
            'Enter your email address to reset your password||$_trPrefix.subtitle'.tr(),
          ),
          SizedBox(height: 12.sc),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email||$_trPrefix.email'.tr(),
              border: const OutlineInputBorder(),
            ),
            controller: this.emailController,
          ),
          SizedBox(height: 12.sc),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: this.onCancel,
                child: Text('Cancel||$_trPrefix.cancel'.tr()),
              ),
              FilledButton(
                onPressed: () async {
                  try {
                    await this.onSend(emailController.text);
                    if (context.mounted) {
                      showMessageToastOverlay(
                        context,
                        message:
                            'An email has been sent to your email address <<<_email>>>. Follow the link in the email to reset your password||$_trPrefix.confirmation_message'
                                .tr(args: {'_email': emailController.text}),
                      );
                    }
                    this.onCancel();
                  } catch (e) {
                    if (context.mounted) {
                      showErrorToastOverlay(
                        context,
                        error: '$e',
                        remover: (r) => Future.delayed(const Duration(seconds: 3), r),
                      );
                    }
                  }
                },
                child: Text('Send||$_trPrefix.send'.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
