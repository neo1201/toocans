import 'package:mmkv/mmkv.dart';

class MMKVSdkUtil {
  MMKVSdkUtil._();

  static initialize() async {
    final rootDir = await MMKV.initialize();
  }
}

/// 路由名称常量
class MMKVUtil {
  MMKVUtil._();

  static final MMKV defaultMMKV = MMKV.defaultMMKV();

  static const String keyUserToken = 'key_user_token';

  static String? getUserToken() {
    return defaultMMKV.decodeString(keyUserToken);
  }

  static void setUserToken(String token) {
    defaultMMKV.encodeString(keyUserToken, token);
  }
}
