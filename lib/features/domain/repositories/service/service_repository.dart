import '../../entities/beauty_service.dart';

abstract class ServiceRepository {
  List<BeautyService> getServices();
  List<String> getCategories();
}
