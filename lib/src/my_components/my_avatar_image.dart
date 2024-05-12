import '/_common.dart';

class MyAvatarImage extends StatelessWidget {
  //
  //
  //

  final ModelFileEntry? file;
  final String? label;
  final void Function()? onPressed;
  final double? size;
  final Color? color;

  //
  //
  //

  const MyAvatarImage({
    super.key,
    required this.file,
    this.label,
    this.onPressed,
    this.size,
    this.color,
  });

  //
  //
  //

  String? get _downloadUrl => this.file?.downloadUrl?.toString();
  bool get _isLikelyUploading => this.file != null && this.file?.downloadUrl == null;

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    final defaultColor = color ?? Theme.of(context).colorScheme.surface;
    return LayoutBuilder(
      builder: (context, constraints) {
        final diameter = this.size ??
            (constraints.maxWidth < constraints.maxHeight
                ? constraints.maxWidth
                : constraints.maxHeight);
        final radius = diameter / 2.0;
        return IconButton(
          onPressed: this.onPressed,
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.sc,
                color: defaultColor.contrast(
                  Theme.of(context).brightness,
                  0.25,
                ),
              ),
            ),
            child: this._isLikelyUploading
                ? SizedBox.square(
                    dimension: this.size,
                    child: const Center(
                      child: MyCircularProgressIndicator(),
                    ),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: radius,
                        backgroundImage: this._downloadUrl != null
                            ? NetworkImage(
                                this._downloadUrl!,
                              )
                            : null,
                        backgroundColor: defaultColor,
                        child: this._downloadUrl == null
                            ? Icon(
                                FluentIcons.line_24_regular,
                                color: Theme.of(context).colorScheme.onSurface,
                                size: 0.75 * diameter,
                              )
                            : null,
                      ),
                      if (this.label != null)
                        WTag(
                          text: this.label!,
                          makeup: WTagMakeup(
                            backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
