import 'package:flutter/material.dart';
import 'package:toocans/common/config/config_controller.dart';
import 'package:toocans/common/manager/app_translations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {


  // 定义主题色常量
  static const Color kPrimaryColor = Color(0xFFBDFD60);
  static const Color kBackgroundColor = Colors.black;
  static double kPadding = 16.0.sp;

  // 语言选项列表
  final List<Map<String, String>> languageOptions = [
    {'label': 'English', 'languageCode': 'en', 'countryCode': 'US'},
    {'label': '简体中文', 'languageCode': 'zh', 'countryCode': 'CN'},
  ];

  // 动态标题
  final RxString pageTitle = ''.obs;

  LanguagePage({super.key}) {
    // 初始化标题为当前语言的 label
    final currentLocale = Get.locale ?? Locale('en', 'US');
    final currentOption = languageOptions.firstWhere(
          (option) => option['languageCode'] == currentLocale.languageCode,
      orElse: () => languageOptions[0], // 默认值为第一个语言选项
    );
    pageTitle.value = currentOption['label']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0, // 移除阴影
        title: Text(
          pageTitle.value, // 动态更新标题
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: Get.back, // 返回上一页
        ),
      ),
      body: Container(
        color: kBackgroundColor,
        child: ListView.builder(
          itemCount: languageOptions.length,
          itemBuilder: (context, index) {
            final option = languageOptions[index];
            return _buildLanguageOption(option, context);
          },
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
      Map<String, String> option, BuildContext context) {
    // 判断是否选中当前语言
    bool isSelected = AppTranslations.getCurrentLocale(context).languageCode ==
        option['languageCode']!;

    return InkWell(
      onTap: () {
        // 切换语言
        AppTranslations.changeLocale(
          context,
          option['languageCode']!,
          option['countryCode'],
        );
        Get.updateLocale(Locale(option['languageCode']!, option['countryCode']));
        // 更新标题为当前选中语言的 label
        pageTitle.value = option['label']!;
        // 返回上一页
        Future.delayed(Duration(milliseconds: 300), () {
          Get.back();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option['label']!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: kPrimaryColor,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}
