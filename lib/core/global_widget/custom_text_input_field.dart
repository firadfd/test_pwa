import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/app_colors.dart';

class CustomTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onSearch;

  const CustomTextInputField({
    super.key,
    required this.controller,
    required this.onSearch,
    this.hintText = 'Search Location',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pinpotBackground,
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: IconButton(
              onPressed: onSearch,
              icon: Icon(Icons.search, color: Colors.grey[600]),
            ), // Search icon
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none, // Remove default border
              ),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          if (controller.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(4.0.r),
              child: GestureDetector(
                onTap: () {
                  controller.clear();
                },
                child: Container(
                  padding: EdgeInsets.all(2.0.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[600]!),
                  ),
                  child: Icon(Icons.close, size: 16.0, color: Colors.grey[600]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
