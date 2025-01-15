import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  void switchToEmail() {
    state.isEmailLogin = true;
  }

  void switchToPhone() {
    state.isEmailLogin = false;
  }

  // 切换同意状态
  void toggleServiceAgree() {
    state.isServiceAgree = !state.isServiceAgree;
  }

  void toggleRegisterAgree() {
    state.isRegisterAgree = !state.isRegisterAgree;
  }
}
