import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toocans/common/utils/mmkv_util.dart';
import 'package:toocans/common/utils/user_util.dart';
import '/common/services/https_client.dart';

import 'config/app_config.dart';
import 'config/config_controller.dart';
import 'manager/app_translations.dart';

class Global {
  static AppTranslations translations = AppTranslations();



  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await translations.loadTranslations(); // 加载 JSON 文件
    // 初始化网络请求
    HttpsClient.initDio();

    // await AppConfig.initialize();

    // 使用 permanent 参数确保控制器不会被销毁
    // Get.put<ConfigController>(ConfigController(), permanent: true);

    await MMKVSdkUtil.initialize();
  }

  static bool isLoggedIn() {
    // 检查用户是否已登录
    return UserUtil.isLoggedIn();
  }
}
