import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/app_colors.dart'; // Ensure you have the screenutil package for responsive height

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.hintText,
    this.maxLength,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h, // Responsive height using ScreenUtil
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB), // Background color
        borderRadius: BorderRadius.circular(12), // Radius
        border: Border.all(
          color: const Color(0xFFEDEEF4), // Border color
          width: 1, // Border width
        ),
      ),
      child: TextFormField(
        textAlign: TextAlign.start,
        maxLength: (maxLength != null && maxLength! > 0) ? maxLength : null,
        style: Theme.of(context).textTheme.labelMedium,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.textExtraLightGray,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          counterText: "",
          border: InputBorder.none, // Remove default border
        ),
      ),
    );
  }
}
