import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.child,
    this.onDismiss,
    this.alignment = Alignment.center,
    this.margin = const EdgeInsets.symmetric(horizontal: 12),
    this.maxWidth = 390,
    this.maxHeight,
    this.backgroundColor = AppColors.white,
    this.barrierColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.padding = EdgeInsets.zero,
    this.dismissOnBarrierTap = true,
  });

  final Widget child;
  final VoidCallback? onDismiss;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry margin;
  final double? maxWidth;
  final double? maxHeight;
  final Color backgroundColor;
  final Color? barrierColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final bool dismissOnBarrierTap;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: barrierColor ?? AppColors.black.withValues(alpha: 0.45),
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: dismissOnBarrierTap ? onDismiss : null,
              ),
            ),
            Align(
              alignment: alignment,
              child: Padding(
                padding: margin,
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: maxWidth ?? double.infinity,
                    maxHeight: maxHeight ?? double.infinity,
                  ),
                  padding: padding,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
