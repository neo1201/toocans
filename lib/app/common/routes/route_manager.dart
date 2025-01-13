import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toocans/app/modules/home/home_main_page.dart';
import 'package:toocans/app/modules/main/tab_page.dart';
import 'package:toocans/app/modules/market/market_main_page.dart';
import 'package:toocans/app/modules/profile/language_page.dart';
import 'package:toocans/app/modules/profile/profile_main_page.dart';

/// 路由管理工具类
class RouteManager {
  /// 路由定义
  static final List<GetPage> routes = [
    GetPage(
      name: RouteNames.home,
      page: () => const HomeMainPage(),
    ),
    GetPage(
      name: RouteNames.market,
      page: () => const MarketMainPage(),
    ),
    GetPage(
      name: RouteNames.profile,
      page: () => ProfileMainPage(),
    ),
    GetPage(
      name: RouteNames.language,
      page: () => LanguagePage(),
    ),
    GetPage(
      name: RouteNames.tabbar,
      page: () => TabPage(),
    ),
  ];

  /// 跳转到指定路由
  static Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return Get.toNamed(routeName, arguments: arguments);
  }

  /// 替换当前页面为指定路由
  static Future<dynamic>? offTo(String routeName, {dynamic arguments}) {
    return Get.offNamed(routeName, arguments: arguments);
  }

  /// 替换所有页面为指定路由（清空路由栈）
  static Future<dynamic>? offAllTo(String routeName, {dynamic arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  /// 返回上一页
  static void goBack({dynamic result}) {
    Get.back(result: result);
  }

  /// 检查是否可以返回上一页
  static bool canGoBack() {
    return Get.key.currentState?.canPop() ?? false;
  }
}

/// 路由名称常量
class RouteNames {
  static const String home = '/home';
  static const String market = '/market';
  static const String profile = '/profile';
  static const String language = '/language';
  static const String tabbar = '/tabbar';

}
