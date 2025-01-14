// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo()
  ..userId = json['userId'] as String
  ..nationalCode = json['nationalCode'] as String?
  ..mobile = json['mobile'] as String?
  ..email = json['email'] as String?
  ..registerType = json['registerType'] as num
  ..concatMobile = json['concatMobile'] as String?
  ..userType = json['userType'] as num
  ..clientId = json['clientId'] as String?
  ..clientKey = json['clientKey'] as String
  ..clientSecret = json['clientSecret'] as String?
  ..grantType = json['grantType'] as String?
  ..deviceType = json['deviceType'] as String
  ..accountId = json['accountId'] as String
  ..setPassword = json['setPassword'] as bool
  ..kycLevel = json['kycLevel'] as num
  ..loginName = json['loginName'] as String
  ..loginId = json['loginId'] as String;

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userId': instance.userId,
      'nationalCode': instance.nationalCode,
      'mobile': instance.mobile,
      'email': instance.email,
      'registerType': instance.registerType,
      'concatMobile': instance.concatMobile,
      'userType': instance.userType,
      'clientId': instance.clientId,
      'clientKey': instance.clientKey,
      'clientSecret': instance.clientSecret,
      'grantType': instance.grantType,
      'deviceType': instance.deviceType,
      'accountId': instance.accountId,
      'setPassword': instance.setPassword,
      'kycLevel': instance.kycLevel,
      'loginName': instance.loginName,
      'loginId': instance.loginId,
    };
