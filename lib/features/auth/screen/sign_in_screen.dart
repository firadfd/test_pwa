import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pwa/core/global_widget/custom_button.dart';
import 'package:test_pwa/core/route/app_route.dart';

import '../../../core/validation/form_validator.dart';
import '../widgets/custom_phone_filed.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String selectedDialCode = '+880'; // Default dial code
  String selectedCountryCode = 'BD'; // Default ISO country code

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: GoogleFonts.quicksand(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              textAlign: TextAlign.left,
              "What Is Your Phone Number",
              style: GoogleFonts.quicksand(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff182035),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "We have send you an One Time Password(OTP) on this mobile number.",
              style: GoogleFonts.quicksand(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 30.h),

            PhoneInputField(validator: FormValidation.validatePhoneNumber),
            SizedBox(height: 20.h),
            CustomButton(
              label: "Login",
              onPressed: () {
                Get.toNamed(AppRoute.otp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
