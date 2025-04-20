import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StampDetailsCard extends StatelessWidget {
  final Function onClick;

  const StampDetailsCard({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Center(
            child: Column(
              children: [
                Text(
                  "Card Name",
                  style: GoogleFonts.quicksand(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "The Best Reward",
                  style: GoogleFonts.quicksand(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Stars with numbers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              int stampNum = index + 7;
              bool isFilled = index < 5; // First 5 stars filled
              return Column(
                children: [
                  Icon(
                    Icons.star,
                    size: 28.sp,
                    color: isFilled ? Colors.amber : Colors.white30,
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: index == 5 ? Colors.white : Colors.grey[800],
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$stampNum',
                      style: GoogleFonts.quicksand(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: index == 5 ? Colors.orange : Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 20.h),

          // Expiry & Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "EXPIRY: 2025-05-30",
                style: GoogleFonts.quicksand(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                ),
                onPressed: () {
                  onClick();
                },
                child: Text(
                  "Use Stamp",
                  style: GoogleFonts.quicksand(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
