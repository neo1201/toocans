import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Text(
              'login.title'.tr,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => GestureDetector(
                onTap: logic.switchToEmail,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: state.isEmailLogin
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: state.isEmailLogin
                          ? Colors.blue
                          : Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              )),
              SizedBox(width: 40),
              Obx(() => GestureDetector(
                onTap: logic.switchToPhone,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: !state.isEmailLogin
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'Phone',
                    style: TextStyle(
                      color: !state.isEmailLogin
                          ? Colors.blue
                          : Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              )),
            ],
          ),
          SizedBox(height: 30),
          // 输入框区域
          Obx(() => AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: state.isEmailLogin
                ? _buildEmailLogin()
                : _buildPhoneLogin(),
          )),
        ],
      ),
    );
  }

  // Email 登录表单
  Widget _buildEmailLogin() {
    return Column(
      key: ValueKey('email'),  // 用于动画
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter your email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    );
  }

  // Phone 登录表单
  Widget _buildPhoneLogin() {
    return Column(
      key: ValueKey('phone'),  // 用于动画
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: 'Enter your phone number',
            prefixIcon: Icon(Icons.phone),
          ),
        ),
        SizedBox(height: 16),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    );
  }
}
