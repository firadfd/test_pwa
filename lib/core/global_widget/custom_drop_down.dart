import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';
import 'controller/custom_drop_down_controller.dart';

class CustomDropDown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String dropdownType;

  const CustomDropDown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.dropdownType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomDropDownController>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Light background color
        borderRadius: BorderRadius.circular(8.r), // Rounded corners
      ),
      child: Center(
        child: Obx(() {
          return DropdownButtonFormField<String>(
            value:
                dropdownType == 'gender'
                    ? controller.selectedGender.value
                    : controller.selectedVehicle.value,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey.shade600,
              size: 20.sp,
            ),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.textExtraLightGray,
            ),
            decoration: InputDecoration(border: InputBorder.none),
            hint: Text(
              hintText,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.textExtraLightGray,
              ),
            ),
            items:
                items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
            onChanged: (newValue) {
              if (dropdownType == 'gender') {
                controller.setSelectedGender(newValue);
              } else {
                controller.setSelectedVehicle(newValue);
              }
            },
          );
        }),
      ),
    );
  }
}
