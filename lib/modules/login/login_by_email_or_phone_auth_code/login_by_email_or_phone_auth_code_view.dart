import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toocans/common/utils/app_colors.dart';

import '../../../common/routes/route_manager.dart';
import 'login_by_email_or_phone_auth_code_logic.dart';
import 'login_by_email_or_phone_auth_code_state.dart';

class LoginByEmailOrPhoneAuthCodePage extends StatelessWidget {
  static void start(bool isEmail) {
    RouteManager.navigateTo(RouteNames.loginByEmailOrPhoneAuthCodePage,
        arguments: {
          "isEmail": isEmail,
        });
  }

  final bool isEmail;

  LoginByEmailOrPhoneAuthCodePage({super.key, required this.isEmail});

  final LoginByEmailOrPhoneAuthCodeLogic logic =
      Get.put(LoginByEmailOrPhoneAuthCodeLogic());
  final LoginByEmailOrPhoneAuthCodeState state =
      Get.find<LoginByEmailOrPhoneAuthCodeLogic>().state;

  String get verificationTitle =>
      isEmail ? "login.emailVerification".tr : "login.phoneVerification".tr;

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
        iconTheme: IconThemeData(
          color: Colors.white, // 设置返回按钮为白色
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                verificationTitle,
                style: TextStyle(
                  color: AppColors.adaptiveTextPrimary,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
