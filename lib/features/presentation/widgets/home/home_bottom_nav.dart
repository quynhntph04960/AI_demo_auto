import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/images/image_network_widget.dart';
import 'home_assets.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      _NavItem('Home', HomeAssets.iconHome, true),
      _NavItem('Video', HomeAssets.iconVideo, false),
      _NavItem('Ảnh', HomeAssets.iconImage, false),
      _NavItem('Tài khoản', HomeAssets.iconUser, false),
      _NavItem('Menu', '', false),
    ];

    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [BoxShadow(color: Color(0x26000000), blurRadius: 1)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in items)
            SizedBox(
              width: 72,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  item.icon.isEmpty
                      ? Icon(
                          Icons.grid_view,
                          size: 25,
                          color: item.active
                              ? AppColors.primary
                              : AppColors.textMuted,
                        )
                      : ImageNetworkWidget(
                          imageUrl: item.icon,
                          width: 25,
                          height: 25,
                          color: item.active
                              ? AppColors.primary
                              : AppColors.textMuted,
                        ),
                  const SizedBox(height: 5),
                  Text(
                    item.label,
                    style: TextStyle(
                      color: item.active
                          ? AppColors.primary
                          : AppColors.textMuted,
                      fontSize: 16,
                      fontWeight: item.active
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.icon, this.active);

  final String label;
  final String icon;
  final bool active;
}
