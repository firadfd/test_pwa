import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_pwa/core/utility/imagePath.dart';
import 'package:test_pwa/features/stamp/widgets/my_card_item.dart';

import '../../../core/route/app_route.dart';
import '../widgets/paggination_bar.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

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
                child: RewardCard(
                  title: 'The Best Reward',
                  subtitle: 'Reward For You',
                  expiryDate: '30, May 2025',
                  rewardProgress: 6,
                  maxProgress: 12,
                  rewardAvailable: 2,
                  toBeRedeemed: 1,
                  nextRewardLabel: 'Fish Ball',
                  leftIcon: ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Image.asset(
                      ImagePath.first,
                      fit: BoxFit.cover,
                      width: 48.w,
                    ),
                  ),
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
