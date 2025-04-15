import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pwa/core/utility/app_colors.dart';
import 'package:test_pwa/core/utility/imagePath.dart';
import 'package:test_pwa/features/stamp/controller/stamp_details_controller.dart';
import 'package:test_pwa/features/stamp/widgets/stamp_details_card.dart';

class StampDetailsScreen extends StatelessWidget {
  StampDetailsScreen({super.key});

  final StampDetailsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Stamp Card Details',
          style: GoogleFonts.quicksand(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Available Stamp
            Row(
              children: [
                Image.asset(ImagePath.stamp, width: 24.w, height: 24.h),
                SizedBox(width: 6.w),
                Text(
                  'Available Stamp : ',
                  style: GoogleFonts.quicksand(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text(
                    '1',
                    style: GoogleFonts.quicksand(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // Main Card
            StampDetailsCard(
              onClick: () {
                controller.showDialogue();
              },
            ),
            SizedBox(height: 20.h),
            RewardTile(
              icon: ImagePath.star,
              stampRequired: 6,
              rewardDetails: 'Best Coffee',
              isRedeemable: true,
            ),
            RewardTile(
              icon: ImagePath.stamp,
              stampRequired: 12,
              rewardDetails: 'Fish Ball',
              isRedeemable: false,
            ),

            SizedBox(height: 20.h),

            // Terms
            Text(
              'Terms & Conditions:',
              style: GoogleFonts.quicksand(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff292D32),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: GoogleFonts.quicksand(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff757575),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RewardTile extends StatelessWidget {
  final String icon;
  final int stampRequired;
  final String rewardDetails;
  final bool isRedeemable;

  const RewardTile({
    super.key,
    required this.icon,
    required this.stampRequired,
    required this.rewardDetails,
    required this.isRedeemable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon with border container
          Container(
            width: 64.w,
            height: 64.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(icon, fit: BoxFit.contain),
          ),
          SizedBox(width: 12.w),

          // Text and Button column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Stamp Required : ',
                        style: GoogleFonts.quicksand(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '$stampRequired',
                        style: GoogleFonts.quicksand(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Reward Details : ',
                        style: GoogleFonts.quicksand(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: rewardDetails,
                        style: GoogleFonts.quicksand(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                // Redeem Button
                ElevatedButton(
                  onPressed:
                      isRedeemable
                          ? () {
                            //TODO
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isRedeemable ? Colors.orange : Colors.grey.shade300,
                    disabledBackgroundColor: Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 5.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Redeem Now',
                    style: GoogleFonts.quicksand(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: isRedeemable ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
