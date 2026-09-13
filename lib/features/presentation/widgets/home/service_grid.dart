import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/images/image_network_widget.dart';
import 'home_assets.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const services = [
      _ServiceItem('Nâng mũi cấu trúc\nNanoForm', HomeAssets.serviceNose),
      _ServiceItem('Nâng ngực Y-shape\nNanochip', HomeAssets.serviceBust),
      _ServiceItem('Nâng mũi cấu trúc\nNanoForm', HomeAssets.serviceNose2),
      _ServiceItem('Nâng mũi cấu trúc\nNanoForm', HomeAssets.serviceFace),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DỊCH VỤ NỔI BẬT',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 17),
          GridView.builder(
            itemCount: services.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 254,
              crossAxisSpacing: 12,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) =>
                _ServiceCard(item: services[index]),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.item});

  final _ServiceItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNetworkWidget(
            imageUrl: item.image,
            height: 190,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
            child: Text(
              item.title,
              maxLines: 2,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceItem {
  const _ServiceItem(this.title, this.image);

  final String title;
  final String image;
}
