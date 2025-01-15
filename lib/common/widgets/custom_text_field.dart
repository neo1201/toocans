import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry contentPadding;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      style: TextStyle(
        fontSize: 12.sp,
        color: AppColors.adaptiveTextPrimary,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          color: AppColors.adaptiveTextHint,
        ),
        contentPadding: contentPadding,
        filled: true,
        fillColor: AppColors.adaptiveEditBg,
        prefixIcon: prefix,
        suffixIcon: suffix,
        // 移除下划线
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        // 移除获得焦点时的下划线
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        // 移除启用状态的下划线
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        // 错误状态下没有下划线
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        // 获得焦点且错误状态下没有下划线
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}