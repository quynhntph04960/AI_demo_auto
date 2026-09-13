import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.height = 52,
    this.textStyle,
    this.hintStyle,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final double height;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        initialValue: controller == null ? initialValue : null,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        enabled: enabled,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        textAlign: textAlign,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        style:
            textStyle ?? const TextStyle(color: AppColors.black, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              hintStyle ??
              const TextStyle(color: AppColors.textMuted, fontSize: 16),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 15,
          ),
          border: _border(AppColors.borderGray),
          enabledBorder: _border(AppColors.borderGray),
          focusedBorder: _border(AppColors.primary),
          disabledBorder: _border(AppColors.borderGray),
        ),
      ),
    );
  }

  static OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: color),
    );
  }
}
