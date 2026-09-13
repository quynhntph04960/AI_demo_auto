import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(20, 20, 20, 24),
    this.borderRadius = const BorderRadius.vertical(top: Radius.circular(20)),
    this.backgroundColor = AppColors.white,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}

Future<T?> showBaseBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
  bool useRootNavigator = false,
  Color barrierColor = const Color(0x73000000),
}) {
  return showModalBottomSheet<T>(
    context: context,
    builder: builder,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    barrierColor: barrierColor,
    backgroundColor: Colors.transparent,
  );
}
