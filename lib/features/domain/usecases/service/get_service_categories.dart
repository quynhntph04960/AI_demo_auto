import '../../repositories/service/service_repository.dart';

class GetServiceCategories {
  const GetServiceCategories(this._repository);

  final ServiceRepository _repository;

  List<String> call() {
    return _repository.getCategories();
  }
}
