// //.title
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //
// // 🇽🇾🇿 & Dev
// //
// // Licencing details are in the LICENSE file in the root directory.
// //
// // ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
// //.title~

// import '/_common.dart';

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class MyCachedImage extends StatefulWidget {
//   //
//   //
//   //

//   final ModelFileEntry file;
//   final double? width;
//   final double? height;
//   final WCachedNetworkImageShape? shape;

//   //
//   //
//   //

//   const MyCachedImage({
//     super.key,
//     required this.file,
//     this.width,
//     this.height,
//     this.shape = const WCachedNetworkImageShapeRectangle(),
//   });

//   //
//   //
//   //

//   @override
//   _State createState() => _State();
// }

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// class _State extends State<MyCachedImage> {
//   //
//   //
//   //

//   void _getCount() {
    
//   }

//   //
//   //
//   //

//   @override
//   Widget build(BuildContext context) {
//     final $shape = this.widget.shape ?? const WCachedNetworkImageShapeRectangle();
//     final imageUrl = this.widget.file.downloadUrl?.toString();
//     assert(imageUrl != null, 'Image URL is null');
//     if (imageUrl == null) return const SizedBox.shrink();
//     final isFlutterImage = widget.file.isFlutterImageExtension();
//     assert(isFlutterImage, 'File is not an image');
//     if (!isFlutterImage) return const SizedBox.shrink();
//     final $key = this.key ?? ValueKey(imageUrl);
//     final image = Image.memory(
//       key: $key,
//       cacheKey: $key.toString(),
//       imageUrl: imageUrl,
//       width: widget.width,
//       height: widget.height,
//       fadeInDuration: const Duration(milliseconds: 200),
//       placeholder: (context, url) => const WCircularProgressIndicator(),
//       fit: BoxFit.cover,
//     );
//     final container = Container(
//       child: image,
//     );
//     final clip = $shape._clip(container);
//     return clip;
//   }
// }

// // ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

// abstract class WCachedNetworkImageShape {
//   const WCachedNetworkImageShape();
//   Widget _clip(Widget child);
// }

// class WCachedNetworkImageShapeRectangle extends WCachedNetworkImageShape {
//   final BorderRadius? borderRadius;
//   const WCachedNetworkImageShapeRectangle({this.borderRadius});

//   @override
//   Widget _clip(Widget child) {
//     return ClipRRect(
//       borderRadius: borderRadius ?? BorderRadius.circular(8.sc),
//       child: child,
//     );
//   }
// }

// class WCachedNetworkImageShapeCircle extends WCachedNetworkImageShape {
//   const WCachedNetworkImageShapeCircle();
//   @override
//   Widget _clip(Widget child) {
//     return ClipOval(
//       child: child,
//     );
//   }
// }
