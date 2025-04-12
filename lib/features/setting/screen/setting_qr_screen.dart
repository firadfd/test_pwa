import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pwa/core/utility/imagePath.dart';

import '../../../core/global_widget/custom_button.dart';
import '../widgets/custom_toggle_tabs.dart';

class SettingQRScreen extends StatelessWidget {
  const SettingQRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.quicksand(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "+0333 990 999 99 9",
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
                child: Image.asset(ImagePath.first, width: 100.w, height: 100.h),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  "https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=+0333%20990%20999%2099%209",
                  width: 200.w,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
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
                        text: 'Member',
                        style: GoogleFonts.quicksand(
                          fontSize: 24.sp,
                          color: const Color(0xFF606268), // Orange
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      TextSpan(
                        text: "QR Code",
                        style: GoogleFonts.quicksand(
                          fontSize: 24.sp,
                          color: const Color(0xFFFF944D), // Orange
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  "Copy or Share the referal code below.",
                  style: GoogleFonts.quicksand(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1C1C1C),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(label: "Log out", onPressed: () {}),
              SizedBox(height: 20.h),
              CustomToggleTabs(
                onTabChanged: (index) {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
