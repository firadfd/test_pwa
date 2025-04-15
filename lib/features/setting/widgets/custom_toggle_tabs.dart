import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleTabs extends StatelessWidget {
  final Function(int) onTabChanged;
  final int selectedIndex;
  final List<TabItemData> items;

  const CustomToggleTabs({
    super.key,
    required this.onTabChanged,
    required this.selectedIndex,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25.r), // Responsive radius
      ),
      child: Row(
        children: List.generate(
          items.length,
              (index) => _buildTab(
            index: index,
            label: items[index].label,
            icon: items[index].icon,
            isSelected: selectedIndex == index,
          ),
        ),
      ),
    );
  }

  Widget _buildTab({
    required int index,
    required String label,
    required IconData icon,
    required bool isSelected,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 40.h,
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(20.r), // Responsive
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? Colors.black : Colors.white,
                ),
                SizedBox(width: 6.w),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabItemData {
  final IconData icon;
  final String label;

  TabItemData({required this.icon, required this.label});
}
