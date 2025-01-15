import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// UI颜色管理类
/// 提供应用程序中使用的所有颜色常量和工具方法
class AppColors {
  const AppColors._(); // 私有构造函数

  // 品牌色
  static const Color brand = Color(0xFFA6FF39);
  static const Color brandLight = Color(0xFF42A5F5);
  static const Color brandDark = Color(0xFF1565C0);

  // 功能色
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF2196F3);

  // 文本颜色
  static const Color textPrimary = Color(0xFFFFFFFF); // 主要文字
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // 主要文字
  static const Color textSecondary = Color(0xFF666666); // 次要文字
  static const Color textSecondaryDark = Color(0xFF666666); // 次要文字
  static const Color textHint = Color(0xFF666666); // 辅助文字
  static const Color textHintDark = Color(0xFF666666); // 辅助文字
  static const Color textLink = Color(0xFF3C7BF4); // 链接文字
  static const Color textLinkDark = Color(0xFF3C7BF4); // 链接文字
  static const Color textBlack = Color(0xFF222222);
  static const Color textBlackDark = Color(0xFF222222);

  // 背景色
  static const Color background = Color(0xFF121212);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color card = Color(0xFF121212);
  static const Color cardDark = Color(0xFF121212);
  static const Color editBg = Color(0xFF222222);
  static const Color editBgDark = Color(0xFF222222);
  static const Color divider = Color(0xFF121212); // 分割线颜色
  static const Color dividerDark = Color(0xFF121212); // 分割线颜色
  static const Color mask = Color(0x99000000); // 遮罩层

  /// 根据主题模式获取对应颜色
  static Color adaptive({
    required Color light,
    required Color dark,
  }) =>
      Get.isDarkMode ? dark : light;

  /// 获取自适应背景色
  static Color get adaptiveBackground => adaptive(
        light: background,
        dark: backgroundDark,
      );

  /// 获取自适应卡片背景色
  static Color get adaptiveCard => adaptive(
        light: card,
        dark: cardDark,
      );

  /// 获取自适应主文本色
  static Color get adaptiveTextPrimary => adaptive(
        light: textPrimary,
        dark: textPrimaryDark,
      );

  /// 获取自适应次要文本色
  static Color get adaptiveTextSecondary => adaptive(
        light: textSecondary,
        dark: textSecondaryDark,
      );

  static Color get adaptiveTextHint => adaptive(
    light: textSecondary,
    dark: textSecondaryDark,
  );

  static Color get adaptiveTextLink => adaptive(
    light: textLink,
    dark: textLinkDark,
  );

  static Color get adaptiveTextBlack => adaptive(
    light: textBlack,
    dark: textBlackDark,
  );

  static Color get adaptiveEditBg => adaptive(
    light: editBg,
    dark: editBgDark,
  );


  /// 获取自适应分割线颜色
  static Color get adaptiveDivider => adaptive(
        light: divider,
        dark: dividerDark,
      );
}
