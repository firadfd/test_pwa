import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_pwa/core/route/app_route.dart';
import 'package:test_pwa/core/utility/imagePath.dart';
import 'package:test_pwa/features/stamp/widgets/new_card_item.dart';

import '../widgets/paggination_bar.dart';

class NewCardScreen extends StatelessWidget {
  const NewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: NewCardItem(
                  title: "New Lunch Deal !",
                  subtitle: "Reward For You",
                  expiryDate: "01 February 2022",
                  totalPoints: 10,
                  rewardCount: 2,
                  stampCount: 0,
                  leftIcon: Image.asset(ImagePath.first, height: 40.h),
                  rightIcon: Icon(Icons.card_giftcard_outlined, size: 40.sp),
                  onTap: () {
                    Get.toNamed(AppRoute.stampDetails);
                  },
                ),
              );
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          child: PaginationBar(
            currentPage: 2,
            totalPages: 5,
            onPageTap: (title) {
              debugPrint("Tapped: $title");
              // Add your pagination logic here
            },
          ),
        ),
      ],
    );
  }
}
