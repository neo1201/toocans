import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsCard extends StatelessWidget {
  final List<SettingItem> items;

  const SettingsCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.sp),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2A2A2A),
            Color(0xFF1F1F1F),
          ],
        ),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return SizedBox(
            height: 60.sp,
            child: Column(
              children: [
                item,
                if (index != items.length - 1)
                  const Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.grey,
                    indent: 16,
                    endIndent: 16,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final String? trailing;
  final VoidCallback? onTap;
  final String imagePath;

  const SettingItem({
    super.key,
    required this.title,
    required this.imagePath,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        imagePath,
        width: 20.w,
        height: 20.h,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFFFFFFFF)
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null)
            Text(
              trailing!,
              style: const TextStyle(color: Color(0xFF999999)),
            ),
          SizedBox(width: 4.sp),
          Icon(Icons.chevron_right, color: Colors.grey, size: 20.sp),
        ],
      ),
    );
  }
}
