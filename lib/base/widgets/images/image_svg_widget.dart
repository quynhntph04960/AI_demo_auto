import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSvgWidget extends StatelessWidget {
  const ImageSvgWidget({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.alignment = Alignment.center,
    this.semanticLabel,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final AlignmentGeometry alignment;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
      alignment: alignment,
      semanticsLabel: semanticLabel,
      placeholderBuilder: (context) => SizedBox(
        width: width,
        height: height,
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorBuilder: (context, error, stackTrace) => SizedBox(
        width: width,
        height: height,
        child: const Icon(Icons.broken_image_outlined),
      ),
    );
  }
}
