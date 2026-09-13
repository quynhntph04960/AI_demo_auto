import '../../entities/beauty_service.dart';
import '../../repositories/service/service_repository.dart';

class GetServices {
  const GetServices(this._repository);

  final ServiceRepository _repository;

  List<BeautyService> call() {
    return _repository.getServices();
  }
}
