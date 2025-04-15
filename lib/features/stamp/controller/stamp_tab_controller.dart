import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StampTabController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var currentIndex = 0.obs;  // Observable variable

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length:3, vsync: this);
    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });
  }

  void changeTab(int index) {
    currentIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
