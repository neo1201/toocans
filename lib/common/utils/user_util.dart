import 'package:toocans/common/utils/mmkv_util.dart';

class UserUtil {
  static bool isLoggedIn() {
    // 检查用户是否已登录
    final userToken = MMKVUtil.getUserToken();
    return userToken != null && userToken.isNotEmpty;
  }
}
