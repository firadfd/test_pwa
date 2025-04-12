import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final VoidCallback ontap;
  double? widths;
  double? borderRadius;
   CustomElevatedButton({
    Key? key,
    this. widths=0,
    this. borderRadius=30,
    required this.ontap,
    required this.text,
    this.backgroundColor,
    this.borderColor= Colors.transparent,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.lightBG,
        minimumSize:  Size(widths==0?double.infinity:widths!,50.h), // Width can be adjusted
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor!),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
      onPressed: () {
        ontap();
      },
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
