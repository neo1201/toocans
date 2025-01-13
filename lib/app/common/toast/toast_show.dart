import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TCToast {

  static Duration _toastDuration = const Duration(milliseconds: 1000); // 默认0.3s

  // 显示普通 Toast
  static void showToast(String msg) {
    EasyLoading.showToast(msg, duration: TCToast._toastDuration);
  }

  // 显示文本 Loading
  static void showLoadingText(String msg) {
    EasyLoading.show(status: msg);
  }

  // 显示默认 Loading
  static void showLoading({String msg = '加载中...'}) {
    EasyLoading.show(status: msg);
  }

  // 显示成功消息
  static void showSuccess(String msg) {
    EasyLoading.showSuccess(msg);
  }

  // 显示错误消息
  static void showError(String msg) {
    EasyLoading.showError(msg);
  }

  // 显示警告消息
  static void showWarn(String msg) {
    EasyLoading.showInfo(msg);
  }

  // 显示进度条
  static void showProgress(double value, {String status = '正在保存...'}) {
    EasyLoading.showProgress(value, status: status);
  }

  // 隐藏 Loading
  static void hide() {
    EasyLoading.dismiss();
  }

  // 设置 Toast 样式
  static void setToastStyle() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Color(0xCC000000)
      ..indicatorColor = Colors.white
      ..progressColor = Colors.white
      ..textColor = Colors.white
      ..fontSize = 15
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..userInteractions = false;
  }

  // 显示自定义加载动画，可以传入GIF图片或文字
  static void showCustomLoading({
    String? gifPath,
    String? text,
    bool showGif = true,
  }) {
    if (gifPath != null && showGif) {
      EasyLoading.show(status: '加载中...', indicator: _CustomLoadingIndicator(gifPath: gifPath));
    } else if (text != null) {
      EasyLoading.show(status: text);
    } else {
      EasyLoading.show(status: '加载中...');
    }
  }
}

class _CustomLoadingIndicator extends StatelessWidget {
  final String gifPath;

  const _CustomLoadingIndicator({required this.gifPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(gifPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
