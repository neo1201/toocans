import 'package:get/get.dart';
import 'package:toocans/modules/home/home_main_page.dart';
import 'package:toocans/modules/login/login_view.dart';
import 'package:toocans/modules/main/tab_page.dart';
import 'package:toocans/modules/market/market_main_page.dart';
import 'package:toocans/modules/profile/language_page.dart';
import 'package:toocans/modules/profile/profile_main_page.dart';
import 'package:toocans/modules/splash/splash_view.dart';


/// 路由名称常量
class RouteNames {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String tabbar = '/tabbar';
  static const String home = '/home';
  static const String market = '/market';
  static const String profile = '/profile';
  static const String language = '/language';
}


/// 路由管理工具类
class RouteManager {
  /// 路由定义
  static final List<GetPage> routes = [
    GetPage(
      name: RouteNames.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteNames.tabbar,
      page: () => TabPage(),
    ),
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
