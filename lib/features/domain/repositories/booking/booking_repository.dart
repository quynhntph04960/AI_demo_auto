import '../../entities/booking_branch.dart';

abstract class BookingRepository {
  List<BookingBranch> getBranches();
}
