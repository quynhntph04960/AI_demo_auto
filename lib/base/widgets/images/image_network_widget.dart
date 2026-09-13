import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.semanticLabel,
    this.borderRadius,
    this.color,
    this.placeholderColor = AppColors.backgroundGray,
    this.errorColor = AppColors.primaryDark,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final String? semanticLabel;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color placeholderColor;
  final Color errorColor;

  @override
  Widget build(BuildContext context) {
    final image = imageUrl.toLowerCase().endsWith('.svg')
        ? SvgPicture.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            semanticsLabel: semanticLabel,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcIn),
            placeholderBuilder: (context) => _ImageFallback(
              width: width,
              height: height,
              color: placeholderColor,
              child: const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            ),
            errorBuilder: (context, error, stackTrace) => _ImageFallback(
              width: width,
              height: height,
              color: errorColor,
              child: const Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.white,
              ),
            ),
          )
        : Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            semanticLabel: semanticLabel,
            color: color,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }

              return _ImageFallback(
                width: width,
                height: height,
                color: placeholderColor,
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return _ImageFallback(
                width: width,
                height: height,
                color: errorColor,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.white,
                ),
              );
            },
          );

    if (borderRadius == null) {
      return image;
    }

    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback({
    required this.color,
    required this.child,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height, color: color, child: child);
  }
}
