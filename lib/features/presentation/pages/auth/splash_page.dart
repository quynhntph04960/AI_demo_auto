import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/images/image_network_widget.dart';
import '../../../../base/widgets/status_bar_widget.dart';
import '../../widgets/auth/auth_assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        top: false,
        child: Stack(children: [StatusBarWidget(), _SplashContent()]),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: const Offset(0, -40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ImageNetworkWidget(
              imageUrl: AuthAssets.splashLogo,
              width: 250,
              height: 202,
              fit: BoxFit.contain,
              placeholderColor: AppColors.primary,
              errorColor: AppColors.primary,
            ),
            const SizedBox(height: 5),
            const Text(
              'Đẹp theo cách bạn muốn',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 26,
                fontFamily: 'Prata',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
