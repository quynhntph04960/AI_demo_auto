import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/base_dialog.dart';
import '../../../../base/widgets/base_dropdown.dart';
import '../../../../base/widgets/base_text_field.dart';
import '../../../../base/widgets/button_widget.dart';
import '../../../data/datasources/booking/booking_local_data_source.dart';
import '../../../data/repositories/booking/booking_repository_impl.dart';
import '../../../domain/entities/booking_branch.dart';
import '../../../domain/usecases/booking/get_booking_branches.dart';

class BookingFormDialog extends StatefulWidget {
  const BookingFormDialog({
    super.key,
    required this.onSubmit,
    required this.onDismiss,
  });

  final VoidCallback onSubmit;
  final VoidCallback onDismiss;

  @override
  State<BookingFormDialog> createState() => _BookingFormDialogState();
}

class _BookingFormDialogState extends State<BookingFormDialog> {
  late final List<BookingBranch> _branches;
  BookingBranch? _selectedBranch;

  @override
  void initState() {
    super.initState();
    _branches = const GetBookingBranches(
      BookingRepositoryImpl(BookingLocalDataSourceImpl()),
    ).call();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 100, left: 12, right: 12),
      maxWidth: 403,
      maxHeight: 600,
      onDismiss: widget.onDismiss,
      child: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            alignment: Alignment.center,
            color: AppColors.primary,
            child: const Text(
              'ĐẶT LỊCH',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(9, 16, 9, 10),
              child: Column(
                children: [
                  const _BookingField(
                    label: 'Họ và tên',
                    hint: 'Điền họ và tên của bạn',
                  ),
                  const SizedBox(height: 16),
                  const _BookingField(
                    label: 'Số điện thoại',
                    hint: 'Điền số điện thoại của bạn',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  const _BookingField(
                    label: 'Dịch vụ',
                    hint: 'Chọn dịch vụ bạn quan tâm',
                  ),
                  const SizedBox(height: 16),
                  _BookingDropdownField(
                    label: 'Chi nhánh',
                    hint: 'Chọn chi nhánh gần bạn',
                    items: _branches,
                    value: _selectedBranch,
                    itemLabelBuilder: (branch) => branch.name,
                    onChanged: (branch) {
                      setState(() => _selectedBranch = branch);
                    },
                  ),
                  const SizedBox(height: 16),
                  const _BookingField(
                    label: 'Thời gian',
                    hint: 'Chọn thời gian đặt lịch',
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget(
                    title: 'GỬI THÔNG TIN',
                    height: 50,
                    width: 185,
                    onPressed: widget.onSubmit,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingField extends StatelessWidget {
  const _BookingField({
    required this.label,
    required this.hint,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        BaseTextField(
          hintText: hint,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}

class _BookingDropdownField<T> extends StatelessWidget {
  const _BookingDropdownField({
    required this.label,
    required this.hint,
    required this.items,
    required this.itemLabelBuilder,
    this.value,
    this.onChanged,
  });

  final String label;
  final String hint;
  final List<T> items;
  final T? value;
  final String Function(T item) itemLabelBuilder;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        BaseDropdown<T>(
          items: items,
          value: value,
          hintText: hint,
          itemLabelBuilder: itemLabelBuilder,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
