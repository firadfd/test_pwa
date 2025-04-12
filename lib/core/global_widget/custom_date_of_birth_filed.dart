import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/app_colors.dart';

class CustomDateOfBirthFiled extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  CustomDateOfBirthFiled({required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.textExtraLightGray
        ),
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Date of birth",
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textExtraLightGray
          ),
          suffixIcon: Icon(
            Icons.calendar_today,
            color: Colors.grey.shade600,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
