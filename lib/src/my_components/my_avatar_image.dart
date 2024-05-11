import '/_common.dart';

class MyAvatarImage extends StatelessWidget {
  //
  //
  //

  final ModelFileEntry? file;
  final String? label;
  final void Function()? onPressed;
  final double? size;

  //
  //
  //

  const MyAvatarImage({
    super.key,
    required this.file,
    this.label,
    this.onPressed,
    this.size,
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
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            child: this._isLikelyUploading
                ? const MyCircularProgressIndicator()
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
                        backgroundColor: Theme.of(context).colorScheme.background,
                        child: this._downloadUrl == null
                            ? Icon(
                                FluentIcons.person_24_regular,
                                color: Theme.of(context).colorScheme.onBackground,
                                size: 0.75 * diameter,
                              )
                            : null,
                      ),
                      if (this.label != null)
                        WTag(
                          text: this.label!,
                          makeup: WTagMakeup(
                            backgroundColor:
                                Theme.of(context).colorScheme.background.withOpacity(0.25),
                            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onBackground.withOpacity(0.25),
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
