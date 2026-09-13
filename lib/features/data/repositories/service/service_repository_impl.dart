import '../../../domain/entities/beauty_service.dart';
import '../../../domain/repositories/service/service_repository.dart';
import '../../datasources/service/service_local_data_source.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  const ServiceRepositoryImpl(this._localDataSource);

  final ServiceLocalDataSource _localDataSource;

  @override
  List<String> getCategories() {
    return _localDataSource.getCategories();
  }

  @override
  List<BeautyService> getServices() {
    return _localDataSource.getServices();
  }
}
