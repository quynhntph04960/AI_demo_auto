import 'package:flutter/material.dart';

import '../../../../base/widgets/base_text_field.dart';
import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/button_widget.dart';
import '../../../../base/widgets/status_bar_widget.dart';
import '../../../data/datasources/auth/auth_local_data_source.dart';
import '../../../data/repositories/auth/auth_repository_impl.dart';
import '../../../domain/usecases/auth/get_saved_auth_contact.dart';
import '../../widgets/auth/auth_leaf_background.dart';

class LoginPasswordPage extends StatelessWidget {
  const LoginPasswordPage({super.key, required this.onLogin});

  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    const dataSource = AuthLocalDataSourceImpl();
    const repository = AuthRepositoryImpl(dataSource);
    const getSavedContact = GetSavedAuthContact(repository);
    final contact = getSavedContact();

    return Scaffold(
      body: Stack(
        children: [
          const AuthLeafBackground(),
          const StatusBarWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 290,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(19, 16, 20, 36),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Vui lòng nhập mật khẩu của bạn',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 18),
                    BaseTextField(
                      initialValue: contact.phoneNumber,
                      readOnly: true,
                      textStyle: const TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const BaseTextField(
                      hintText: 'Nhập mật khẩu của bạn tại đây',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(title: 'ĐĂNG NHẬP', onPressed: onLogin),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
