import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pwa/core/utility/app_colors.dart';

class RewardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String expiryDate;
  final int rewardProgress;
  final int maxProgress;
  final int rewardAvailable;
  final int toBeRedeemed;
  final String nextRewardLabel;
  final Widget leftIcon;
  final VoidCallback onTap;

  const RewardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.expiryDate,
    required this.rewardProgress,
    required this.maxProgress,
    required this.rewardAvailable,
    required this.toBeRedeemed,
    required this.nextRewardLabel,
    required this.leftIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double progress = rewardProgress / maxProgress;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Top section
              Container(
                padding: EdgeInsets.symmetric(horizontal:8.w,vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          subtitle,
                          style: GoogleFonts.quicksand(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Expiry date',
                              style: GoogleFonts.quicksand(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Header row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        leftIcon,
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.quicksand(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          expiryDate,
                          style: GoogleFonts.quicksand(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Reward Progress: $rewardProgress/$maxProgress',
                      style: GoogleFonts.quicksand(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'You will get a $nextRewardLabel after collecting $maxProgress stamps.',
                      style: GoogleFonts.quicksand(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Progress bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: LinearProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        minHeight: 12.h,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10.r),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Reward Available
                        Column(
                          children: [
                            Text(
                              rewardAvailable.toString().padLeft(2, '0'),
                              style: GoogleFonts.quicksand(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              'Reward available',
                              style: GoogleFonts.quicksand(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D7278),
                              ),
                            ),
                          ],
                        ),
                        // To be Redeemed
                        Column(
                          children: [
                            Text(
                              toBeRedeemed.toString().padLeft(2, '0'),
                              style: GoogleFonts.quicksand(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              'To be redeemed',
                              style: GoogleFonts.quicksand(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6D7278),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          text: "Next Reward: ",
                          style: GoogleFonts.quicksand(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6D7278),
                          ),
                          children: [
                            TextSpan(
                              text: nextRewardLabel,
                              style: GoogleFonts.quicksand(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
