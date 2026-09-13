import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../base/constants/app_colors.dart';
import '../../../../base/widgets/base_text_field.dart';
import '../../../../base/widgets/button_widget.dart';
import '../../../../base/widgets/status_bar_widget.dart';
import '../../widgets/auth/auth_leaf_background.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, required this.onContinue});

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
              height: 321,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 22, 19, 28),
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
                      'XÁC THỰC OTP',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Mã xác thực đã được gửi đến số điện thoại',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                    const Text(
                      '0899828486',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 19),
                    const _OtpFields(),
                    const SizedBox(height: 16),
                    ButtonWidget(title: 'TIẾP TỤC', onPressed: onContinue),
                    const SizedBox(height: 17),
                    const Text(
                      'Gửi lại OTP (56 giây)',
                      style: TextStyle(color: AppColors.black, fontSize: 16),
                    ),
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

class _OtpFields extends StatefulWidget {
  const _OtpFields();

  @override
  State<_OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<_OtpFields> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _handleChanged(int index, String value) {
    if (value.length > 1) {
      final lastDigit = value.characters.last;
      _controllers[index].text = lastDigit;
      _controllers[index].selection = const TextSelection.collapsed(offset: 1);
    }

    if (_controllers[index].text.isNotEmpty) {
      if (index < _focusNodes.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 6; i++) ...[
          SizedBox(
            width: 48,
            child: BaseTextField(
              controller: _controllers[i],
              focusNode: _focusNodes[i],
              height: 48,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              onChanged: (value) => _handleChanged(i, value),
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (i < 5) const SizedBox(width: 8),
        ],
      ],
    );
  }
}
