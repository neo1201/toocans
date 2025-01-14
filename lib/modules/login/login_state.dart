import 'package:get/get.dart';

class LoginState {
  LoginState() {
    ///Initialize variables
  }

  // 登录方式：true 为 email, false 为 phone
  final _isEmailLogin = true.obs;
  get isEmailLogin => _isEmailLogin.value;
  set isEmailLogin(value) => _isEmailLogin.value = value;
}
