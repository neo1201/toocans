import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:toocans/app/common/toast/toast_show.dart';
import 'package:toocans/app/modules/home/home_main_page.dart';
import 'package:toocans/app/modules/market/market_main_page.dart';
import 'package:toocans/app/modules/profile/profile_main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeMainPage(),
    const MarketMainPage(),
    ProfileMainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFF00FF00),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24.sp), // 使用适配的图标大小
            label: 'tab.home'.tr, // 使用国际化
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.candlestick_chart, size: 24.sp),
            label: 'tab.market'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24.sp),
            label: 'tab.account'.tr,
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 14.sp), // 适配选中状态字体大小
        unselectedLabelStyle: TextStyle(fontSize: 12.sp), // 适配未选中状态字体大小
      ),
    );
  }
}
