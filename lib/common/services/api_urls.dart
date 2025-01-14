
// url列表
class ApiUrls {
  /// 配置相关接口


  /// 用户相关接口

  /// 登录接口
  static const String login = '/auth/login';
  /// 退出登录
  static const String logout = '/auth/logout';

  /// 刷新token
  static const String refreshToken = '/refreshToken';
  /// 生成验证码
  static const String postCode = '/auth/code';
  /// 短信验证码
  static const String smsCode = '/resource/sms/code';
  /// 邮箱验证码
  static const String emailCode = '/resource/email/code';
  /// 修改密码
  static const String updatePassword = '/user/updatePassword';
  /// 用户Info
  static const String userInfo = '/user/info';

}