import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/route/app_route.dart';
import '../widgets/custom_pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                "OTP Verification",
                style: GoogleFonts.quicksand(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff182035),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  children: [
                    TextSpan(
                      text: 'Enter the code from the sms we sent\n',
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF606268), // Orange
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'to ',
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF606268), // Orange
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "+0333 990 999 99 9",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFFFF944D), // Orange
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h),
            CustomPinput(),
            SizedBox(height: 20.h),
            CustomButton(
              label: "Continue",
              onPressed: () {
                Get.toNamed(AppRoute.settingQR);
              },
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  children: [
                    TextSpan(
                      text: "I didn't receive any code ",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFF606268), // Orange
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "RESEND",
                      style: GoogleFonts.quicksand(
                        color: const Color(0xFFFF944D), // Orange
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
