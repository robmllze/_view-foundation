//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '_m_file_gallery_file_action.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MFileGalleryFile extends StatelessWidget {
  //
  //
  //

  final void Function(ModelFileEntry? file)? onDelete;
  final void Function(ModelFileEntry? file)? onDownload;
  final void Function(ModelFileEntry? file)? onTap;
  final ModelFileEntry? file;
  final Widget? child;

  //
  //
  //

  const MFileGalleryFile({
    super.key,
    this.onDelete,
    this.onDownload,
    this.onTap,
    this.file,
    this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap != null ? () => this.onTap!(this.file) : null,
      child: Stack(
        fit: StackFit.expand,
        children: [
          WClippedContainer(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8.sc),
            ),
            child: () {
              final file = this.file;
              if (file != null) {
                final downloadUrl = file.downloadUrl;
                if (downloadUrl != null) {
                  if (file.isFlutterImageExtension()) {
                    return WClippedContainer(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(
                          downloadUrl.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    final a = (file.displayName?.value ?? file.name ?? file.id);
                    final b = String.fromCharCodes(a!.codeUnits.take(12));
                    final c = a.length > b.length ? '$b...' : a;
                    return Center(
                      child: Text(
                        c,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                } else {
                  return const MCircularProgressIndicator();
                }
              }
              if (this.child != null) {
                return child!;
              }
            }(),
          ),
          if (this.onDownload != null)
            MFileGalleryFileAction(
              alignment: Alignment.bottomLeft,
              file: this.file,
              icon: FluentIcons.arrow_download_24_filled,
              onTap: this.onDownload,
            ),
          if (this.onDelete != null)
            MFileGalleryFileAction(
              alignment: Alignment.bottomRight,
              file: this.file,
              icon: FluentIcons.delete_24_regular,
              onTap: this.onDelete,
            ),
        ],
      ),
    );
  }
}
