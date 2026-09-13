import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../widgets/home/floating_contact_actions.dart';
import '../../widgets/home/home_bottom_nav.dart';
import '../../widgets/home/home_category_grid.dart';
import '../../widgets/home/home_header.dart';
import '../../widgets/home/service_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.showFloatingActions = false});

  final bool showFloatingActions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeCategoryGrid(),
                      Container(
                        height: 10,
                        width: double.infinity,
                        color: AppColors.backgroundGray,
                      ),
                      const ServiceGrid(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: HomeBottomNav(),
          ),
          if (showFloatingActions) const FloatingContactActions(),
        ],
      ),
    );
  }
}
