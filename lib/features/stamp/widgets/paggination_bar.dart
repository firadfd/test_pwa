import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(String title) onPageTap;

  const PaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageTap,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate nearby page numbers to show
    final List<int> visiblePages = [];

    if (currentPage > 1) visiblePages.add(currentPage - 1);
    visiblePages.add(currentPage);
    if (currentPage < totalPages) visiblePages.add(currentPage + 1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Back Button
        _paginationButton("Back", isEnabled: currentPage > 1, onTap: () => onPageTap("Back")),
        SizedBox(width: 8.w),

        // Page Numbers
        for (final page in visiblePages) ...[
          _pageButton(
            number: page,
            isSelected: page == currentPage,
            onTap: () => onPageTap(page.toString()),
          ),
          SizedBox(width: 8.w),
        ],

        // Next Button
        _paginationButton("Next", isEnabled: currentPage < totalPages, onTap: () => onPageTap("Next")),
      ],
    );
  }

  Widget _paginationButton(String title, {required bool isEnabled, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            if (title == "Back") Icon(Icons.chevron_left, size: 18.sp),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: isEnabled ? Colors.black : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (title == "Next") Icon(Icons.chevron_right, size: 18.sp),
          ],
        ),
      ),
    );
  }

  Widget _pageButton({required int number, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 14.sp,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
