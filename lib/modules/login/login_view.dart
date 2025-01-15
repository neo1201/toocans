import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toocans/common/routes/route_manager.dart';
import 'package:toocans/common/utils/assets_path_util.dart';

import '../../common/utils/app_colors.dart';
import '../../common/widgets/custom_text_field.dart';
import 'login_by_email_or_phone_auth_code/login_by_email_or_phone_auth_code_view.dart';
import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'login.title'.tr,
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.adaptiveTextPrimary,
                          ),
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                          AssetsPathUtil.getLoginImagePath2x(
                              "ic_login_logo_toocans.png"),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Obx(() => GestureDetector(
                            onTap: logic.switchToEmail,
                            child: Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                'login.email'.tr,
                                style: TextStyle(
                                  color:
                                      _getSelectTextColor(state.isEmailLogin),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )),
                      Obx(() => GestureDetector(
                            onTap: logic.switchToPhone,
                            child: Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                'login.phone'.tr,
                                style: TextStyle(
                                  color:
                                      _getSelectTextColor(!state.isEmailLogin),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 30),
                  // 输入框区域
                  Obx(
                    () => AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: state.isEmailLogin
                          ? _buildEmailLogin()
                          : _buildPhoneLogin(),
                    ),
                  ),
                ],
              ),
            ),
            // 底部 Checkbox 和文本
            Padding(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Checkbox
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        logic.toggleRegisterAgree();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          _getCheckboxAssetName(state.isRegisterAgree),
                          width: 16, // 未选中状态图标
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'login.registerTips'.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.adaptiveTextPrimary,
                    ),
                  ),
                  // 多色文本
                ],
              ),
            ),
            SizedBox(height: 8),
            // 底部 Checkbox 和文本
            Padding(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Checkbox
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        logic.toggleServiceAgree();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          _getCheckboxAssetName(state.isServiceAgree),
                          width: 16, // 未选中状态图标
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'login.userService'.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.adaptiveTextPrimary,
                    ),
                  ),
                  // 多色文本
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: GestureDetector(
                onTap: () {
                  // 处理隐私政策点击
                },
                child: Text(
                  'login.agreementAndPrivacyPolicy'.tr,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textLink,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity, // 按钮宽度占满
                height: 40, // 按钮高度
                child: ElevatedButton(
                  onPressed: () {
                    // 处理点击事件
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brand,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(
                    'common.next'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.adaptiveTextBlack,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCheckboxAssetName(bool isSelect) {
    return isSelect
        ? AssetsPathUtil.getCommonImagePath2x("ic_checkbox_select.png")
        : AssetsPathUtil.getCommonImagePath2x("ic_checkbox_un_select.png");
  }

  Color _getSelectTextColor(bool isSelect) {
    return isSelect
        ? AppColors.adaptiveTextPrimary
        : AppColors.adaptiveTextSecondary;
  }

  // Email 登录表单
  Widget _buildEmailLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: ValueKey('email'), // 用于动画
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            hintText: 'login.emailEditHint'.tr,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            hintText: 'login.password'.tr,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              // 跳转到验证码登录页面
              LoginByEmailOrPhoneAuthCodePage.start(state.isEmailLogin);
            },
            child: Text(
              "login.emailCodeLogin".tr,
              style:
                  TextStyle(color: AppColors.adaptiveTextLink, fontSize: 12.sp),
            ),
          ),
        )
      ],
    );
  }

  // Phone 登录表单
  Widget _buildPhoneLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: ValueKey('phone'), // 用于动画
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            hintText: 'login.phoneEditHint'.tr,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextField(
            hintText: 'login.password'.tr,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              // 跳转到验证码登录页面
              LoginByEmailOrPhoneAuthCodePage.start(state.isEmailLogin);
            },
            child: Text(
              "login.phoneCodeLogin".tr,
              style:
              TextStyle(color: AppColors.adaptiveTextLink, fontSize: 12.sp),
            ),
          ),
        )
      ],
    );
  }
}
