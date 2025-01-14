import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  // 应用名称
  static String? appName;
  // 包名
  static String? packageName;
  // 版本号
  static String? version;
  // 构建号
  static String? buildNumber;

  /// 初始化配置
  static Future<void> initialize() async {
    final packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  /// 获取应用名称
  static String getAppName() {
    return appName ?? "Unknown App";
  }

  /// 获取包名
  static String getPackageName() {
    return packageName ?? "Unknown Package";
  }

  /// 获取应用版本号
  static String getAppVersion() {
    return version ?? "Unknown Version";
  }

  /// 获取构建号
  static String getBuildNumber() {
    return buildNumber ?? "Unknown Build Number";
  }

  /// 获取完整的版本信息 (版本号 + 构建号)
  static String getFullVersion() {
    if (version != null && buildNumber != null) {
      return "$version+$buildNumber";
    }
    return "Unknown Version";
  }
}
