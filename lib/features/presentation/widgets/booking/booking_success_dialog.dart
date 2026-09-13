import 'package:flutter/material.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/base_dialog.dart';
import '../../../../base/widgets/button_widget.dart';

class BookingSuccessDialog extends StatelessWidget {
  const BookingSuccessDialog({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      maxWidth: 330,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 18),
      onDismiss: onClose,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bạn đã đăng ký lịch Nâng mũi thành công! Chúng tôi sẽ liên hệ lại với bạn trong thời gian sớm nhất!',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.black, fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            title: 'ĐÓNG',
            height: 42,
            width: 159,
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
