import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/images/image_network_widget.dart';
import 'home_assets.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key, this.selectedIndex = 0, this.onItemTap});

  final int selectedIndex;
  final ValueChanged<int>? onItemTap;

  @override
  Widget build(BuildContext context) {
    const items = [
      _NavItem('Home', HomeAssets.iconHome),
      _NavItem('Video', HomeAssets.iconVideo),
      _NavItem('Ảnh', HomeAssets.iconImage),
      _NavItem('Tài khoản', HomeAssets.iconUser),
      _NavItem('Menu', ''),
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
          for (var index = 0; index < items.length; index++)
            InkWell(
              onTap: () => onItemTap?.call(index),
              child: SizedBox(
                width: 72,
                child: _BottomNavItem(
                  item: items[index],
                  active: selectedIndex == index,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({required this.item, required this.active});

  final _NavItem item;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.primary : AppColors.textMuted;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        item.icon.isEmpty
            ? Icon(Icons.grid_view, size: 25, color: color)
            : ImageNetworkWidget(
                imageUrl: item.icon,
                width: 25,
                height: 25,
                color: color,
              ),
        const SizedBox(height: 5),
        Text(
          item.label,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: active ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.icon);

  final String label;
  final String icon;
}
