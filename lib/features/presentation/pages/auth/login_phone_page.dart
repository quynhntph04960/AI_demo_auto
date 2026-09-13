import 'package:flutter/material.dart';

import '../../../../base/widgets/base_text_field.dart';
import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/button_widget.dart';
import '../../../../base/widgets/status_bar_widget.dart';
import '../../widgets/auth/auth_leaf_background.dart';

class LoginPhonePage extends StatelessWidget {
  const LoginPhonePage({super.key, required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AuthLeafBackground(),
          const StatusBarWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 305,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(19, 21, 20, 29),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Bắt đầu trải nghiệm cùng Đông Á',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 19),
                  const BaseTextField(
                    hintText: 'Nhập số điện thoại của bạn tại đây',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 19),
                  ButtonWidget(title: 'TIẾP TỤC', onPressed: onContinue),
                  const SizedBox(height: 17),
                  Text.rich(
                    const TextSpan(
                      text: 'Tôi đồng ý với ',
                      style: TextStyle(color: AppColors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'điều kiện và điều khoản sử dụng',
                          style: TextStyle(
                            color: AppColors.accent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 17),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(0, 24),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Đăng nhập sau',
                      style: TextStyle(color: AppColors.primary, fontSize: 16),
                    ),
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
