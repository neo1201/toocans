class UserModel {
  String? userId;
  String? nationalCode;
  String? mobile;
  String? email;
  int? registerType; // 修改为 int，通常注册类型是数字枚举
  String? concatMobile;
  int? userType; // 修改为 int
  String? region;
  String? clientId;
  String? clientKey;
  String? clientSecret;
  String? grantType;
  String? deviceType;
  int? accountId; // 修改为 int
  bool? setPassword; // 修改为 bool
  int? kycLevel; // 修改为 int
  String? loginId;
  String? loginName;

  // 构造函数，使用可选参数
  UserModel({
    this.userId,
    this.nationalCode,
    this.mobile,
    this.email,
    this.registerType,
    this.concatMobile,
    this.userType,
    this.region,
    this.clientId,
    this.clientKey,
    this.clientSecret,
    this.grantType,
    this.deviceType,
    this.accountId,
    this.setPassword,
    this.kycLevel,
    this.loginId,
    this.loginName,
  });

  // 从 JSON 构造 UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String?,
      nationalCode: json['nationalCode'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      registerType: json['registerType'] as int?,
      concatMobile: json['concatMobile'] as String?,
      userType: json['userType'] as int?,
      region: json['region'] as String?,
      clientId: json['clientId'] as String?,
      clientKey: json['clientKey'] as String?,
      clientSecret: json['clientSecret'] as String?,
      grantType: json['grantType'] as String?,
      deviceType: json['deviceType'] as String?,
      accountId: json['accountId'] as int?,
      setPassword: json['setPassword'] as bool?,
      kycLevel: json['kycLevel'] as int?,
      loginId: json['loginId'] as String?,
      loginName: json['loginName'] as String?,
    );
  }

  // 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nationalCode': nationalCode,
      'mobile': mobile,
      'email': email,
      'registerType': registerType,
      'concatMobile': concatMobile,
      'userType': userType,
      'region': region,
      'clientId': clientId,
      'clientKey': clientKey,
      'clientSecret': clientSecret,
      'grantType': grantType,
      'deviceType': deviceType,
      'accountId': accountId,
      'setPassword': setPassword,
      'kycLevel': kycLevel,
      'loginId': loginId,
      'loginName': loginName,
    };
  }
}
