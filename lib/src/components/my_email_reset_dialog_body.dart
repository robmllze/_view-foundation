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

class MyEmailResetDialogBody extends StatelessWidget {
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
    return DialogBody(
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
            decoration: InputDecoration(
              labelText: 'Email||todo'.tr(),
              border: const OutlineInputBorder(),
            ),
            controller: this.emailController,
            onSubmitted: this.onSend,
          ),
          SizedBox(height: 12.sc),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: this.onCancel,
                child: Text('Cancel||todo'.tr()),
              ),
              FilledButton(
                onPressed: () async {
                  try {
                    await this.onSend(emailController.text);
                    if (context.mounted) {
                      showMessageToastOverlay(
                        context,
                        message:
                            'An email has been sent to your email address {email}. Follow the link in the email to reset your password||todo'
                                .tr(args: {'email': emailController.text}),
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
                child: Text('Send||todo'.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
