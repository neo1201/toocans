import 'package:flutter/material.dart';

class TCBottomToast {
  static OverlayEntry? _overlayEntry;

  // 显示底部 Toast
  static void showBottomToast({
    required BuildContext context,
    required String message,
    Widget? icon,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onClose,
  }) {
    // 如果有已存在的 Toast，先移除
    _removeToast();

    // 创建一个新的 OverlayEntry
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF333333), // 背景色
              borderRadius: BorderRadius.circular(12), // 圆角
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 图标
                if (icon != null) icon else const Icon(Icons.check_circle, color: Colors.green, size: 24),
                const SizedBox(width: 8), // 间距
                // 文本
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8), // 间距
                // 关闭按钮
                GestureDetector(
                  onTap: () {
                    _removeToast();
                    if (onClose != null) onClose(); // 调用关闭回调
                  },
                  child: const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // 插入到 Overlay
    Overlay.of(context)?.insert(_overlayEntry!);

    // 延迟移除 Toast
    Future.delayed(duration, () {
      _removeToast();
      if (onClose != null) onClose(); // 调用关闭回调
    });
  }

  // 移除 Toast
  static void _removeToast() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
