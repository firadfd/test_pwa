import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utility/app_colors.dart';
import '../../../core/utility/imagePath.dart';
import '../controller/redeem_dialogue_controller.dart';

class RedemptionDialog extends StatelessWidget {
  const RedemptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RedeemDialogueController());

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your Redemption Code:',
              style: GoogleFonts.quicksand(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6.h),
            Obx(() => Text(
              controller.redemptionCode.value,
              style: GoogleFonts.quicksand(
                fontSize: 50.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            )),
            SizedBox(height: 16.h),
            Image.asset(ImagePath.first, width: 120.w, height: 120.h),
            SizedBox(height: 20.h),
            Obx(() => Text.rich(
              TextSpan(
                text: 'Redemption Code Countdown : ',
                style: GoogleFonts.quicksand(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: controller.countdown.value.toString().padLeft(2, '0'),
                    style: GoogleFonts.quicksand(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: 6.h),

            // Note
            Text(
              "If not Redeemed in time , please Get a new Code",
              style: GoogleFonts.quicksand(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff666666),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),

            // Close Button
            ElevatedButton(
              onPressed: controller.closeDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor:AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                'Close',
                style: GoogleFonts.quicksand(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
