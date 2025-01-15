import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CenterDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  CenterDialog({
    super.key,
    this.title,
    this.content,
    this.onCancel,
    required this.onConfirm,
    this.cancelText,
    this.confirmText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 300.sp,
          padding: EdgeInsets.all(24.sp),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (content != null) ...[
                SizedBox(height: 16.h),
                Text(
                  content!,
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 14.sp,
                  ),
                ),
              ],
              SizedBox(height: 34.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _DialogButton(
                      text: cancelText == null ? 'profile.exit_dialog.cancel'.tr : cancelText!,
                      backgroundColor: Color(0xFF666666),
                      textColor: Color(0xFFDDDDDD),
                      onTap: () {
                        Navigator.of(context).pop();
                        onCancel?.call();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _DialogButton(
                      text: confirmText == null ? 'profile.exit_dialog.confirm'.tr : cancelText!,
                      backgroundColor: Color(0xFFA6FF39),
                      textColor: Color(0xFF222222),
                      onTap: () {
                        Navigator.of(context).pop();
                        onConfirm?.call();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const _DialogButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20.sp),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.sp),
        child: Container(
          height: 40.sp,
          width: 100.sp,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
