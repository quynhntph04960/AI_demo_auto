import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/status_bar_widget.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.primary,
      child: Stack(
        children: [
          const StatusBarWidget(),
          Positioned(
            left: 29,
            top: 49,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8F4F1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: AppColors.primary,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 11),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chúc Chị buổi tối vui vẻ',
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Nguyễn Thị Hoa',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
