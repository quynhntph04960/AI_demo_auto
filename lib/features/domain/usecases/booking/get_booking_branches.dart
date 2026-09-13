import '../../entities/booking_branch.dart';
import '../../repositories/booking/booking_repository.dart';

class GetBookingBranches {
  const GetBookingBranches(this._repository);

  final BookingRepository _repository;

  List<BookingBranch> call() {
    return _repository.getBranches();
  }
}
