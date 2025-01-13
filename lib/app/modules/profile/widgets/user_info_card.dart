import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
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
      child: Row(
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
                'abcd@gmail.com',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'UID:012123123',
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
                  color: Color(0xFFB2CC45),
                  borderRadius: BorderRadius.circular(4.sp),
                ),
                child: Text(
                  'Unverified',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFFFD4970),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
