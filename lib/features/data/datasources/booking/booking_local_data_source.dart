import '../../models/booking/booking_branch_model.dart';

abstract class BookingLocalDataSource {
  List<BookingBranchModel> getBranches();
}

class BookingLocalDataSourceImpl implements BookingLocalDataSource {
  const BookingLocalDataSourceImpl();

  @override
  List<BookingBranchModel> getBranches() {
    return const [
      BookingBranchModel(name: 'Hà Nội'),
      BookingBranchModel(name: 'TP. Hồ Chí Minh'),
      BookingBranchModel(name: 'Đà Nẵng'),
      BookingBranchModel(name: 'Hải Phòng'),
      BookingBranchModel(name: 'Cần Thơ'),
    ];
  }
}
