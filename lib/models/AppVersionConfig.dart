import 'package:json_annotation/json_annotation.dart';

part 'AppVersionConfig.g.dart';

@JsonSerializable()
class AppVersionConfig {
  AppVersionConfig();

  late String id;
  late String appId;
  late String appVersion;
  late String deviceType;
  late String deviceVersion;
  late String appChannel;
  late num needUpdate;
  late num needForceUpdate;
  late String updateVersion;
  late String downloadUrl;
  late String created;
  late String updated;
  late num enableStatus;
  late String newFeatures;
  
  factory AppVersionConfig.fromJson(Map<String,dynamic> json) => _$AppVersionConfigFromJson(json);
  Map<String, dynamic> toJson() => _$AppVersionConfigToJson(this);
}
