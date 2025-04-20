import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../core/utility/app_colors.dart';
import '../controller/otp_controller.dart';

class CustomPinput extends StatelessWidget {
  final controller = Get.put(OTPController());

  final FocusNode _focusNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: 56.w,
    height: 56.h,
    textStyle: GoogleFonts.poppins(
      fontSize: 24.sp,
      color: Color(0xff9CA4AB),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: AppColors.pinpotBackground,
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(8.r),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 56.w,
    height: 56.h,
    textStyle: TextStyle(
      fontSize: 20.sp,
      color: AppColors.textLightGray,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: AppColors.pinpotBackground,
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(8.r),
    ),
  );

  CustomPinput({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   FocusScope.of(context).requestFocus(_focusNode);
    // });
    return Center(
      child: Pinput(
        controller: controller.otpController,
        length: 4,
        onChanged: controller.setOtp,
        onCompleted: (otp) {},
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        focusNode: _focusNode,
      ),
    );
  }
}
