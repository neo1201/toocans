import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toocans/common/utils/mmkv_util.dart';
import 'package:toocans/common/utils/user_util.dart';

import 'config/config_controller.dart';
import 'manager/app_translations.dart';

class Global {
  static AppTranslations translations = AppTranslations();
  static final ConfigController controller = Get.put(ConfigController());

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await translations.loadTranslations(); // 加载 JSON 文件
    await MMKVSdkUtil.initialize();
  }

  static bool isLoggedIn() {
    // 检查用户是否已登录
    return UserUtil.isLoggedIn();
  }
}
