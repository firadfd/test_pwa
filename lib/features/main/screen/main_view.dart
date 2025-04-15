import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../setting/widgets/custom_toggle_tabs.dart';
import '../controller/main_view_controller.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final controller = Get.find<MainViewController>();

  final List<TabItemData> tabItems = [
    TabItemData(icon: Icons.card_giftcard_outlined, label: 'Stamp Card'),
    TabItemData(icon: Icons.settings, label: 'Setting'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentPage),
      bottomNavigationBar: Obx(
            () => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: CustomToggleTabs(
              items: tabItems,
              selectedIndex: controller.currentIndex.value,
              onTabChanged: controller.changePage,
            ),
          ),
        ),
      ),
    );
  }
}
