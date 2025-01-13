import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toocans/app/common/manager/app_translations.dart';
import 'package:toocans/app/modules/profile/controller/profile_controller.dart';
import '../../common/routes/route_manager.dart';
import 'widgets/user_info_card.dart';
import 'widgets/settings_card.dart';
import 'package:get/get.dart';

class ProfileMainPage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  ProfileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch<EasyLocalization>();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Column(
        children: [
          const UserInfoCard(),
          Expanded(
            child: Transform.translate(
              offset: Offset(0, -40.h), // 向上移动 40 像素
              child: ListView(
                physics: NeverScrollableScrollPhysics(), // 禁止滚动
                padding: EdgeInsets.zero, // 将内边距设为 0
                children: [
                  SettingsCard(
                    items: [
                      SettingItem(
                        imagePath: 'assets/images/profile/ic_pro_language.png',
                        title: "profile.home.language".tr,
                        trailing: AppTranslations.getCurrentLocale(context)
                                    .languageCode ==
                                'en'
                            ? 'English'
                            : '中文',
                        onTap: () {
                          RouteManager.navigateTo(RouteNames.language);
                        },
                      ),
                      SettingItem(
                        imagePath: 'assets/images/profile/ic_pro_password.png',
                        title: "profile.home.password".tr,
                      ),
                      SettingItem(
                        imagePath: 'assets/images/profile/ic_pro_id.png',
                        title: "profile.home.verification".tr,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h), // 使用屏幕适配的间距
                  SettingsCard(
                    items: [
                      SettingItem(
                        imagePath: 'assets/images/profile/ic_pro_customer.png',
                        title: "profile.home.customer".tr,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SettingsCard(
                    items: [
                      SettingItem(
                        imagePath: 'assets/images/profile/ic_pro_exit.png',
                        title: "profile.home.exit".tr,
                      ),
                      SettingItem(
                        imagePath: 'assets/images/profile/ic_pro_delete.png',
                        title: "profile.home.account".tr,
                      ),
                      SettingItem(
                        imagePath: 'assets/images/profile/ic_pro_version.png',
                        title: "profile.home.appversion".tr,
                        trailing: '1.0.1',
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
