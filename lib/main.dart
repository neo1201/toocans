import 'package:flutter/material.dart';
import 'package:toocans/common/routes/route_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'common/global.dart';

void main() async {
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 设计稿的宽高 (单位: px)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Global.translations,
          // 设置翻译类
          locale: Get.deviceLocale,
          // 根据系统语言设置默认语言
          fallbackLocale: Locale('en', 'US'),
          // 如果系统语言不支持，则使用英文
          builder: EasyLoading.init(),
          initialRoute: RouteNames.tabbar,
          getPages: RouteManager.routes, // 注册路由
        );
      },
    );
  }
}
