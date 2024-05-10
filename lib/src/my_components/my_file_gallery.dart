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

class MyFileGallery extends StatelessWidget {
  //
  //
  //

  final List<ModelFileEntry> files;
  final void Function(ModelFileEntry file)? onDownload;
  final void Function(ModelFileEntry file)? onDelete;
  final void Function(ModelFileEntry file)? onLongPress;

  //
  //
  //

  const MyFileGallery({
    super.key,
    required this.files,
    this.onDownload,
    this.onDelete,
    this.onLongPress,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.sc,
        crossAxisSpacing: 8.sc,
        mainAxisSpacing: 8.sc,
      ),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final file = files[index];
        final downloadUrl = file.downloadUrl?.toString();
        if (downloadUrl != null) {
          return GestureDetector(
            onLongPress: this.onLongPress != null ? () => this.onLongPress!(file) : null,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8.sc),
                  ),
                  child: file.isFlutterImageExtension()
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.sc),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(
                              downloadUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : () {
                          final a = (file.title ?? file.name ?? file.id);
                          final b = String.fromCharCodes(a!.codeUnits.take(12));
                          final c = a.length > b.length ? '$b...' : a;
                          return Center(
                            child: Text(
                              c,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }(),
                ),
                if (this.onDownload != null)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.background.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(8.sc),
                        child: Icon(
                          FluentIcons.arrow_download_24_filled,
                          size: 24.sc,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () => this.onDownload!(file),
                    ),
                  ),
                if (this.onDelete != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.background.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(8.sc),
                        child: Icon(
                          FluentIcons.delete_24_filled,
                          size: 24.sc,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () => this.onDelete!(file),
                    ),
                  ),
              ],
            ),
          );
        } else {
          return Center(
            child: SizedBox.square(
              dimension: 60.sc,
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
