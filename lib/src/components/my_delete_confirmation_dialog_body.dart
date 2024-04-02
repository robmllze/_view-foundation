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

class MyDeleteConfirmationDialog extends StatelessWidget {
  //
  //
  //

  final TextEditingController passwordController;
  final void Function() onCancel;
  final Future<void> Function(String password) onDelete;

  //
  //
  //

  const MyDeleteConfirmationDialog({
    super.key,
    required this.passwordController,
    required this.onCancel,
    required this.onDelete,
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
            'Delete Account||todo'.tr(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.sc),
          Text(
            'Enter your password to delete your account||todo'.tr(),
          ),
          SizedBox(height: 12.sc),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password||todo'.tr(),
              border: const OutlineInputBorder(),
            ),
            obscureText: true,
            controller: this.passwordController,
            onSubmitted: this.onDelete,
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
                    await this.onDelete(passwordController.text);
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
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
}
