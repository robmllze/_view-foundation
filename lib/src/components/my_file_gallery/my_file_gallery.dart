//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// 🇽🇾🇿 & Dev
//
// Licencing details are in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '_my_file_gallery_file.dart';

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyFileGallery extends StatefulWidget {
  //
  //
  //

  final List<ModelFileEntry> files;
  final void Function(List<ModelFileEntry>)? onReorderCompleted;
  final void Function(ModelFileEntry? file)? onDownload;
  final void Function(ModelFileEntry? file)? onDelete;
  final void Function(ModelFileEntry? file)? onTap;

  //
  //
  //

  const MyFileGallery({
    super.key,
    this.files = const [],
    this.onReorderCompleted,
    this.onDownload,
    this.onDelete,
    this.onTap,
  });

  //
  //
  //

  @override
  _State createState() => _State();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _State extends State<MyFileGallery> {
  //
  //
  //

  late final _orderedFiles = List.of(this.widget.files)
    ..sort((a, b) {
      final now = DateTime.now();
      final da = a.createdReg?.registeredAt ?? now;
      final db = b.createdReg?.registeredAt ?? now;
      final c = da.compareTo(db);
      return c;
    });

  //
  //
  //

  void _moveFile(int oldIndex, int newIndex) {
    this.setState(() {
      final item = this._orderedFiles.removeAt(oldIndex);
      this._orderedFiles.insert(newIndex, item);
      if (this.widget.onReorderCompleted != null) {
        this.widget.onReorderCompleted!(this._orderedFiles);
      }
    });
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final minDimension = min(constraints.maxWidth, constraints.maxHeight);
        final spacing = 8.sc;
        final itemSize = 0.5 * (minDimension - spacing);
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: spacing,
          runSpacing: spacing,
          children: [
            if (this._orderedFiles.isEmpty)
              WPlaceholder(message: 'No files found.||no_files_found'.tr()),
            ...List.generate(this._orderedFiles.length, (index) {
              final file = this._orderedFiles[index];
              return DragTarget<ModelFileEntry>(
                onAcceptWithDetails: (details) {
                  final file = details.data;
                  final oldIndex = this._orderedFiles.indexOf(file);
                  final newIndex = index;
                  this._moveFile(oldIndex, newIndex);
                },
                builder: (context, candidateData, rejectedData) {
                  return Draggable<ModelFileEntry>(
                    data: file,
                    feedback: WAnimatedScale(
                      begin: 1.0,
                      end: 0.75,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linearToEaseOut,
                      child: Material(
                        color: Colors.transparent,
                        elevation: 4.0,
                        child: SizedBox.square(
                          dimension: itemSize,
                          child: MyFileGalleryFile(
                            file: file,
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: SizedBox.square(
                      dimension: itemSize,
                      child: Opacity(
                        opacity: 0.5,
                        child: MyFileGalleryFile(
                          file: file,
                        ),
                      ),
                    ),
                    child: SizedBox.square(
                      dimension: itemSize,
                      child: MyFileGalleryFile(
                        file: file,
                        onDownload: this.widget.onDownload,
                        onDelete: this.widget.onDelete,
                        onTap: this.widget.onTap,
                      ),
                    ),
                    onDragCompleted: () {},
                  );
                },
              );
            }),
          ],
        );
      },
    );
  }
}
