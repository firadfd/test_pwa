import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pwa/features/setting/screen/setting_screen.dart';

import '../../stamp/screen/stamp_screen.dart';

class MainViewController extends GetxController {
  var currentIndex = 0.obs;

  final screens = [
    StampScreen(),
    SettingScreen()
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  Widget get currentPage => screens[currentIndex.value];
}
