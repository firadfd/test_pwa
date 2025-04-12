import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

circularProgressIndicator() {
  return Container(
      height: 80.h,
      width: 80.w,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      ));
}
