import 'package:get/get.dart';

class LoginState {
  LoginState() {
    ///Initialize variables
  }

  // 登录方式：true 为 email, false 为 phone
  final _isEmailLogin = true.obs;
  get isEmailLogin => _isEmailLogin.value;
  set isEmailLogin(value) => _isEmailLogin.value = value;

  final RxBool _isServiceAgree = false.obs;
  get isServiceAgree => _isServiceAgree.value;
  set isServiceAgree(value) => _isServiceAgree.value = value;


  final RxBool _isRegisterAgree = false.obs;
  get isRegisterAgree => _isRegisterAgree.value;
  set isRegisterAgree(value) => _isRegisterAgree.value = value;
}
