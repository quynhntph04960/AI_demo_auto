import '../../../presentation/widgets/home/home_assets.dart';
import '../../models/service/beauty_service_model.dart';

abstract class ServiceLocalDataSource {
  List<BeautyServiceModel> getServices();
  List<String> getCategories();
}

class ServiceLocalDataSourceImpl implements ServiceLocalDataSource {
  const ServiceLocalDataSourceImpl();

  @override
  List<BeautyServiceModel> getServices() {
    return const [
      BeautyServiceModel(
        title: 'Nâng mũi cấu trúc NanoForm',
        category: 'Mũi',
        imageUrl: HomeAssets.serviceNose,
        description: 'Dáng mũi thanh thoát, hài hòa đường nét khuôn mặt.',
      ),
      BeautyServiceModel(
        title: 'Nâng ngực Y-shape Nanochip',
        category: 'Ngực',
        imageUrl: HomeAssets.serviceBust,
        description: 'Định hình vòng một mềm mại, cân đối và tự nhiên.',
      ),
      BeautyServiceModel(
        title: 'Nâng mũi cấu trúc NanoForm Plus',
        category: 'Mũi',
        imageUrl: HomeAssets.serviceNose2,
        description: 'Giải pháp cải thiện sống mũi, đầu mũi và trụ mũi.',
      ),
      BeautyServiceModel(
        title: 'Tạo hình gương mặt V-line',
        category: 'Mặt',
        imageUrl: HomeAssets.serviceFace,
        description: 'Tinh chỉnh đường nét để gương mặt cân đối hơn.',
      ),
    ];
  }

  @override
  List<String> getCategories() {
    return const ['Tất cả', 'Mũi', 'Ngực', 'Mặt'];
  }
}
