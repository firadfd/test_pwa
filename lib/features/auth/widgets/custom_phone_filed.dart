import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utility/app_colors.dart';
import '../controller/sign_in_controller.dart';

class PhoneInputField extends StatelessWidget {
  final String? Function(String?)? validator;
  final controller = Get.put(SignInController());

  PhoneInputField({super.key, this.validator});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Color(0xffFB933C)),
            ),
            child: Padding(
              padding: EdgeInsets.all(5.r),
              child: CountryCodePicker(
                onChanged: (CountryCode countryCode) {
                  controller.updateCountryCode(countryCode);
                },
                initialSelection: controller.selectedCountryCode.value.code,
                showCountryOnly: true,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
                dialogTextStyle: GoogleFonts.poppins(
                  fontSize: 17.sp,
                  color: AppColors.textLightDark,
                  fontWeight: FontWeight.w400,
                ),
                padding: EdgeInsets.zero,
                hideSearch: true,
                hideCloseIcon: true,
                textStyle: GoogleFonts.poppins(
                  fontSize: 17.sp,
                  color: AppColors.textLightDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w, child: Container(color: Colors.transparent)),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Color(0xffFB933C)),
              ),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                style: GoogleFonts.poppins(
                  fontSize: 17.sp,
                  color: AppColors.textLightGray,
                  fontWeight: FontWeight.w400,
                ),
                validator: validator,
                controller: controller.phoneController,
                onChanged: (value) => controller.phoneNumber.value = value,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 17.sp,
                    color: AppColors.textLightGray,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
