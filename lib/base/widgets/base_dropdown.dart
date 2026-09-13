import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BaseDropdown<T> extends StatelessWidget {
  const BaseDropdown({
    super.key,
    required this.items,
    required this.itemLabelBuilder,
    this.value,
    this.hintText,
    this.height = 52,
    this.onChanged,
  });

  final List<T> items;
  final T? value;
  final String? hintText;
  final double height;
  final String Function(T item) itemLabelBuilder;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DropdownButtonFormField<T>(
        initialValue: value,
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.textMuted,
          size: 24,
        ),
        dropdownColor: AppColors.white,
        style: const TextStyle(color: AppColors.black, fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 16),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 15,
          ),
          border: _border(AppColors.borderGray),
          enabledBorder: _border(AppColors.borderGray),
          focusedBorder: _border(AppColors.primary),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  itemLabelBuilder(item),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
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
