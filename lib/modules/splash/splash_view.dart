import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';
import 'splash_state.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final SplashLogic logic = Get.put(SplashLogic());
  final SplashState state = Get.find<SplashLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text('SplashPage'),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('count'),
            ),
          ],
        ));
  }
}
