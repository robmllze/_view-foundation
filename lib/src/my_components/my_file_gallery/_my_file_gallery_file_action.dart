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

class MyFileGalleryFileAction extends StatelessWidget {
  //
  //
  //

  final AlignmentGeometry alignment;
  final ModelFileEntry? file;
  final IconData icon;
  final void Function(ModelFileEntry? file)? onTap;

  //
  //
  //

  const MyFileGalleryFileAction({
    super.key,
    required this.alignment,
    this.file,
    required this.icon,
    required this.onTap,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: this.alignment,
      child: IconButton(
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.background.withOpacity(0.5),
          ),
          padding: EdgeInsets.all(8.sc),
          child: Icon(
            this.icon,
            size: 20.sc,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onPressed: this.onTap != null ? () => this.onTap!(this.file) : null,
      ),
    );
  }
}
