import 'package:flutter/material.dart';

import 'image_svg_widget.dart';

class ImageAssetWidget extends StatelessWidget {
  const ImageAssetWidget({
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
    if (assetPath.toLowerCase().endsWith('.svg')) {
      return ImageSvgWidget(
        assetPath: assetPath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment,
        semanticLabel: semanticLabel,
      );
    }

    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      semanticLabel: semanticLabel,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: width,
          height: height,
          child: const Icon(Icons.image_not_supported_outlined),
        );
      },
    );
  }
}
