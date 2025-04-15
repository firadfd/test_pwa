import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pwa/core/utility/app_colors.dart';
import 'package:test_pwa/features/stamp/widgets/ticket_shape_border.dart';

import 'dotted_ticket_painter.dart';

class NewCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String expiryDate;
  final int totalPoints;
  final int rewardCount;
  final int stampCount;
  final Widget leftIcon;
  final Widget rightIcon;
  final VoidCallback onTap;

  const NewCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.expiryDate,
    required this.totalPoints,
    required this.rewardCount,
    required this.stampCount,
    required this.leftIcon,
    required this.rightIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final shape = TicketShapeBorder(
      borderRadius: BorderRadius.circular(16.r),
      notchRadius: 12.r,
    );

    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: DottedTicketPainter(
          shape: shape,
          color: Colors.black26,
          dotRadius: 1.2.r,
          spacing: 5.r,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: shape,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double dividerPosition = constraints.maxWidth * 0.775;

              return Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Section
                      SizedBox(
                        width: dividerPosition,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subtitle,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff282828),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.w, top: 4.h),
                                      child: leftIcon,
                                    ),
                                    Text(
                                      title,
                                      style: GoogleFonts.quicksand(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff282828),
                                      ),
                                    ),
                                  ],),
                                  SizedBox(height: 6.h),
                                  RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.quicksand(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff6D7278),
                                      ),
                                      children: [
                                        const TextSpan(text: "Total Point : "),
                                        TextSpan(
                                          text: "$totalPoints",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        const TextSpan(text: " / Reward: "),
                                        TextSpan(
                                          text: "$rewardCount",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        const TextSpan(text: " / Stamp: "),
                                        TextSpan(
                                          text: "$stampCount",
                                          style: GoogleFonts.quicksand(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color:AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "Expiry date",
                                    style: GoogleFonts.quicksand(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6D7278),
                                    ),
                                  ),
                                  Text(
                                    expiryDate,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right Section
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: rightIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Vertical Divider
                  Positioned(
                    left: dividerPosition,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
