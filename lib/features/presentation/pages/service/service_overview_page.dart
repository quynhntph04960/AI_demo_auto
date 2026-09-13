import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/images/image_network_widget.dart';
import '../../../data/datasources/service/service_local_data_source.dart';
import '../../../data/repositories/service/service_repository_impl.dart';
import '../../../domain/entities/beauty_service.dart';
import '../../../domain/usecases/service/get_service_categories.dart';
import '../../../domain/usecases/service/get_services.dart';

class ServiceOverviewPage extends StatefulWidget {
  const ServiceOverviewPage({super.key});

  @override
  State<ServiceOverviewPage> createState() => _ServiceOverviewPageState();
}

class _ServiceOverviewPageState extends State<ServiceOverviewPage> {
  late final List<BeautyService> _services;
  late final List<String> _categories;
  var _selectedCategory = 'Tất cả';

  @override
  void initState() {
    super.initState();
    const repository = ServiceRepositoryImpl(ServiceLocalDataSourceImpl());
    _services = const GetServices(repository).call();
    _categories = const GetServiceCategories(repository).call();
  }

  @override
  Widget build(BuildContext context) {
    final services = _selectedCategory == 'Tất cả'
        ? _services
        : _services
              .where((service) => service.category == _selectedCategory)
              .toList();

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.primary,
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top + 18,
            left: 16,
            right: 16,
            bottom: 18,
          ),
          child: const Text(
            'DỊCH VỤ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DỊCH VỤ TỔNG',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        height: 38,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            final category = _categories[index];
                            return _ServiceCategoryChip(
                              title: category,
                              selected: category == _selectedCategory,
                              onTap: () {
                                setState(() => _selectedCategory = category);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 96),
                sliver: SliverGrid.builder(
                  itemCount: services.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 274,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    return _ServiceOverviewCard(service: services[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ServiceCategoryChip extends StatelessWidget {
  const _ServiceCategoryChip({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(19),
      onTap: onTap,
      child: Container(
        height: 38,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.mintBorder,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? AppColors.white : AppColors.black,
            fontSize: 15,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _ServiceOverviewCard extends StatelessWidget {
  const _ServiceOverviewCard({required this.service});

  final BeautyService service;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
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
            imageUrl: service.imageUrl,
            height: 156,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 9, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 15,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  service.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 13,
                    height: 1.25,
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
