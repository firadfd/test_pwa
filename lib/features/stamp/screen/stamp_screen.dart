import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pwa/features/stamp/screen/new_card_screen.dart';

import '../../../core/utility/app_colors.dart';
import '../controller/stamp_tab_controller.dart';
import 'expired_card_screen.dart';
import 'my_card_screen.dart';

class StampScreen extends StatelessWidget {
  StampScreen({super.key});

  final StampTabController stampTabController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stamp Card',
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(vertical: 4.h),
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: GetBuilder<StampTabController>(
              builder:
                  (controller) => TabBar(
                    controller: controller.tabController,
                    onTap: controller.changeTab,
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    labelColor: AppColors.primaryColor,
                    unselectedLabelColor: const Color(0xffB1B1B1),
                    labelStyle: GoogleFonts.quicksand(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: GoogleFonts.quicksand(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorPadding: EdgeInsets.zero,
                    tabs: [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Text(
                            "New Card",
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Text(
                            "My Card",
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Expanded(
                            child: Text(
                              "Expired Card",
                              maxLines: 1,
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          ),
        ),
      ),
      body: GetBuilder<StampTabController>(
        builder: (controller) {
          return TabBarView(
            controller: controller.tabController,
            children: const [
              NewCardScreen(),
              MyCardScreen(),
              ExpiredCardScreen(),
            ],
          );
        },
      ),
    );
  }
}
