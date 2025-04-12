import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Appbar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  bool? lead;
  String title;
  Color? backgroundColor;
  Color? iconColor;
  Color? textColor;

  @override
  Custom_Appbar(
    this.title, {
    Key? key,
    this.lead,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  }) : preferredSize = Size.fromHeight(56.h),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      leading:
          lead == false
              ? Text("")
              : InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back, color: iconColor),
              ),
    );
  }
}