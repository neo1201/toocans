import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toocans/app/common/services/api_urls.dart';
import 'package:toocans/app/common/services/https_client.dart';
import 'package:toocans/app/modules/user/model/user_model.dart';

class ProfileController extends GetxController {
  final Rx<UserModel?> userInfo = Rx<UserModel?>(null);

  getUserInfo() {
    HttpsClient.get(
      ApiUrls.userInfo,  // API 路径
      null,  
      loadingText: '加载中...',
      success: (data) {
        userInfo.value = UserModel.fromJson(data['data']);
      },
      fail: (code, msg) {
        print('获取用户信息失败: code=$code, msg=$msg');
      },
    );
  }
}