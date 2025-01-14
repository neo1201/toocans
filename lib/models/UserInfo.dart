import 'package:json_annotation/json_annotation.dart';

part 'UserInfo.g.dart';

@JsonSerializable()
class UserInfo {
  UserInfo();

  late String userId;
  String? nationalCode;
  String? mobile;
  String? email;
  late num registerType;
  String? concatMobile;
  late num userType;
  String? clientId;
  late String clientKey;
  String? clientSecret;
  String? grantType;
  late String deviceType;
  late String accountId;
  late bool setPassword;
  late num kycLevel;
  late String loginName;
  late String loginId;
  
  factory UserInfo.fromJson(Map<String,dynamic> json) => _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
