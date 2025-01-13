import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  final Map<String, Map<String, String>> _translations = {};

  Future<void> loadTranslations() async {
    // 加载 JSON 文件
    final enUS = await _loadJson('assets/lang/en_us.json');
    final zhCN = await _loadJson('assets/lang/zh_cn.json');

    // 添加到翻译表
    _translations['en_US'] = _flattenMap(enUS);
    _translations['zh_CN'] = _flattenMap(zhCN);
  }

  // 加载 JSON 文件并解析
  Future<Map<String, dynamic>> _loadJson(String path) async {
    final data = await rootBundle.loadString(path);
    return json.decode(data);
  }

  // 扁平化嵌套 Map
  Map<String, String> _flattenMap(Map<String, dynamic> map, [String prefix = '']) {
    final Map<String, String> result = {};
    map.forEach((key, value) {
      final newKey = prefix.isEmpty ? key : '$prefix.$key';
      if (value is Map<String, dynamic>) {
        result.addAll(_flattenMap(value, newKey));
      } else {
        result[newKey] = value.toString();
      }
    });
    return result;
  }

  @override
  Map<String, Map<String, String>> get keys => _translations;


  static Locale getCurrentLocale(BuildContext context) {
    return Get.locale ?? Locale('en', 'US'); // 默认语言
  }

  static void changeLocale(
      BuildContext context, String languageCode, [String? countryCode]) {
    Locale newLocale = Locale(languageCode, countryCode);
    Get.updateLocale(newLocale); // 更新语言
  }
}
