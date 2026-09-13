import '../../../domain/entities/booking_branch.dart';
import '../../../domain/repositories/booking/booking_repository.dart';
import '../../datasources/booking/booking_local_data_source.dart';

class BookingRepositoryImpl implements BookingRepository {
  const BookingRepositoryImpl(this._localDataSource);

  final BookingLocalDataSource _localDataSource;

  @override
  List<BookingBranch> getBranches() {
    return _localDataSource.getBranches();
  }
}
