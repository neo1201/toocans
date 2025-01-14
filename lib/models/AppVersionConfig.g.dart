// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppVersionConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersionConfig _$AppVersionConfigFromJson(Map<String, dynamic> json) =>
    AppVersionConfig()
      ..id = json['id'] as String
      ..appId = json['appId'] as String
      ..appVersion = json['appVersion'] as String
      ..deviceType = json['deviceType'] as String
      ..deviceVersion = json['deviceVersion'] as String
      ..appChannel = json['appChannel'] as String
      ..needUpdate = json['needUpdate'] as num
      ..needForceUpdate = json['needForceUpdate'] as num
      ..updateVersion = json['updateVersion'] as String
      ..downloadUrl = json['downloadUrl'] as String
      ..created = json['created'] as String
      ..updated = json['updated'] as String
      ..enableStatus = json['enableStatus'] as num
      ..newFeatures = json['newFeatures'] as String;

Map<String, dynamic> _$AppVersionConfigToJson(AppVersionConfig instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appId': instance.appId,
      'appVersion': instance.appVersion,
      'deviceType': instance.deviceType,
      'deviceVersion': instance.deviceVersion,
      'appChannel': instance.appChannel,
      'needUpdate': instance.needUpdate,
      'needForceUpdate': instance.needForceUpdate,
      'updateVersion': instance.updateVersion,
      'downloadUrl': instance.downloadUrl,
      'created': instance.created,
      'updated': instance.updated,
      'enableStatus': instance.enableStatus,
      'newFeatures': instance.newFeatures,
    };
