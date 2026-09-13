import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/images/image_network_widget.dart';
import 'home_assets.dart';

class HomeCategoryGrid extends StatelessWidget {
  const HomeCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      _CategoryItem('Săn quà', HomeAssets.iconGift),
      _CategoryItem('Ưu đãi', HomeAssets.iconOffer),
      _CategoryItem('Đặt lịch', HomeAssets.iconBooking),
      _CategoryItem('Kinh nghiệm\nlàm đẹp', HomeAssets.iconBeauty),
      _CategoryItem('Check in', HomeAssets.iconCheckIn),
      _CategoryItem('Liên hệ', HomeAssets.iconContact),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 21, 11, 0),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 100,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) => _CategoryTile(item: items[index]),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.item});

  final _CategoryItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.mintBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ImageNetworkWidget(imageUrl: item.icon, width: 35, height: 35),
        ),
        const SizedBox(height: 8),
        Text(
          item.label,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            height: 1.15,
          ),
        ),
      ],
    );
  }
}

class _CategoryItem {
  const _CategoryItem(this.label, this.icon);

  final String label;
  final String icon;
}
