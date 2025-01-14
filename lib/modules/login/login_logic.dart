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
}
