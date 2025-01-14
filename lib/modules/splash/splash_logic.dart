import 'package:get/get.dart';

import '../../common/global.dart';
import '../../common/routes/route_manager.dart';
import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onReady() {
    super.onReady();
    checkLoginStatus();
  }

  void checkLoginStatus() {
    // 延迟执行以确保初始化完成
    Future.delayed(Duration(milliseconds: 200), () {
      // 检查登录状态
      bool isLoggedIn = Global.isLoggedIn(); // 需要在 Global 中实现此方法
      // 根据登录状态跳转
      if (isLoggedIn) {
        Get.offAllNamed(RouteNames.tabbar);
      } else {
        Get.offAllNamed(RouteNames.login);
      }
    });
  }
}
