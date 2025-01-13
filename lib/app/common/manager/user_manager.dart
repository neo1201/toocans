
import 'dart:convert';

import 'package:toocans/app/modules/user/model/user_model.dart';
import '../untils/tc_storage_utils.dart';

class UserManager {
  static const String _userKey = 'current_user'; // 存储用户信息的键
  static const String _loginStatusKey = 'login_status'; // 登录状态存储键

  /// 检查用户是否已登录
  static Future<bool> isLogin() async {
    bool? isLoggedIn = TcStorageUtils.getBool(_loginStatusKey);
    return isLoggedIn ?? false; // 默认返回 false
  }

  /// 获取当前用户信息
  static Future<UserModel?> currentUser() async {
    var userJson = TcStorageUtils.getString(_userKey);
    if (userJson != null && userJson.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  /// 保存用户信息并设置登录状态为已登录
  static Future<void> saveUser(UserModel user) async {
    String userJson = jsonEncode(user.toJson());
    await TcStorageUtils.saveString(_userKey, userJson);
    await TcStorageUtils.saveBool(_loginStatusKey, true); // 设置登录状态为 true
  }

  /// 清除当前用户信息并设置登录状态为未登录
  static Future<void> clearUser() async {
    await TcStorageUtils.remove(_userKey); // 移除用户信息
    await TcStorageUtils.saveBool(_loginStatusKey, false); // 设置登录状态为 false
  }

  /// 检查用户信息是否有效（简单示例，可自定义校验逻辑）
  static Future<bool> validateUser() async {
    UserModel? user = await currentUser();
    return user != null && user.userId != null && user.userId!.isNotEmpty;
  }
}
