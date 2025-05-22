import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildSelectionUI(
  BuildContext context,
  VoidCallback onCancelSelection,
  VoidCallback onSelectAll,
  VoidCallback ensureDalete,
  int selectedItem,
) {
  return SafeArea(
    child: Container(
      color: Color(0xFF303030),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: onCancelSelection,
          ),
          Text(
            '$selectedItem Selected',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.crop_square, color: Colors.white),
            onPressed: onSelectAll,
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: selectedItem == 0 ? null : ensureDalete,
          ),
        ],
      ),
    ),
  );
}
