
import 'package:get/get.dart';
import 'package:toocans/common/config/app_config.dart';
import 'package:toocans/common/services/api_urls.dart';
import 'package:toocans/common/services/https_client.dart';
import 'package:toocans/models/index.dart';

import '../../../common/toast/toast_show.dart';

class ProfileController extends GetxController {
  final Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);

  checkVersionAction() {
    getAppVersion();
  }


  getAppVersion() {
    var params = {
      "appId": "com.app.toocans",
      "appVersion": "1.00",
      "deviceType": "ios",
      "appChannel": "appstore"
    };
    HttpsClient.post(
      ApiUrls.appVersionConfig, // API 路径
      params,
      success: (data) {
        var version = AppVersionConfig.fromJson(data['data']);
        if (version.needForceUpdate == 1) { //强制更新
          
        } else if (version.needUpdate == 1) {  //不强制更新
          
        } else {
          TCToast.showToast("Your version is up to date".tr);
        }
      },
      fail: (code, msg) {

      },
    );
  }

  getUserInfo() {
    HttpsClient.get(
      ApiUrls.userInfo,  // API 路径
      null,  
      // loadingText: '加载中...',
      success: (data) {
        userInfo.value = UserInfo.fromJson(data['data']);
      },
      fail: (code, msg) {
        print('获取用户信息失败: code=$code, msg=$msg');
      },
    );
  }
  
  @override
  void onReady() {
    super.onReady();
    getUserInfo();
  }
}