import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class UserInfoCard extends StatelessWidget {
  UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return GetBuilder<ProfileController>(
      init: ProfileController(), // 初始化控制器
      builder: (controller) {
        return Container(
            height: 179.h + statusBarHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFB5FF00),
                  Color(0xFF88E500),
                ],
              ),
            ),
            child: Obx(() {
              final user = controller.userInfo.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 16.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.sp),
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      child: Image.asset(
                        "assets/images/profile/ic_default_header.png",
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 让子组件垂直居中
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.loginName ?? 'xxx',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'UID:${user?.userId}',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(user?.kycLevel == 1 ? 0xFF28B470 : 0xFFE37154),
                          borderRadius: BorderRadius.circular(4.sp),
                        ),
                        child: Text(
                          user?.kycLevel == 1 ? 'user.kycLevel_1'.tr : 'user.kycLevel_0'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            })
        );
      },
    );
  }
}
