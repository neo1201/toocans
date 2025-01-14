import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/config_controller.dart';
import 'manager/app_translations.dart';

class Global{
  static AppTranslations translations = AppTranslations();
  static final ConfigController controller = Get.put(ConfigController());

  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await translations.loadTranslations(); // 加载 JSON 文件
  }
}