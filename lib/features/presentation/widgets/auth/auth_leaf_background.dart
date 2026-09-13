import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/images/image_network_widget.dart';
import 'auth_assets.dart';

class AuthLeafBackground extends StatelessWidget {
  const AuthLeafBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: ImageNetworkWidget(
        imageUrl: AuthAssets.leafBackground,
        fit: BoxFit.cover,
        errorColor: AppColors.primaryDark,
      ),
    );
  }
}
