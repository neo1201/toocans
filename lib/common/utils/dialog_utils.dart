import 'package:flutter/material.dart';
import '../dialog/center_dialog.dart';
import 'package:get/get.dart';

class DialogUtils {
  static Future<bool?> showCenterDialog({
    String? title,
    String? content,
    String? cancelText,
    String? confirmText,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) {
    return showDialog<bool>(
      context: Get.context!, // 修正为 Get.context 确保兼容性
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => CenterDialog(
        title: title,
        content: content,
        cancelText: cancelText,
        confirmText: confirmText,
        onCancel: () {
          // Navigator.of(context).pop(false); // 返回 false 表示取消操作
          onCancel?.call();
        },
        onConfirm: () {
          // Navigator.of(context).pop(true); // 返回 true 表示确认操作
          onConfirm?.call();
        },
      ),
    );
  }
}

