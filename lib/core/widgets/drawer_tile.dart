import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          selected
              ? Colors.orange.withAlpha((0.15 * 255).toInt())
              : Colors.transparent,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
          child: Row(
            children: [
              Icon(
                icon,
                color: selected ? Colors.orange : Colors.grey[700],
                size: 26.sp,
              ),
              SizedBox(width: 16.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.orange : Colors.grey[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
