import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> buildAppBarActions(
  BuildContext context,
  int currentTabIndex,
  VoidCallback onSelect,
) {
  return [
    GestureDetector(
      onTap: currentTabIndex == 0 ? onSelect : null,
      child: Text(
        'SELECT',
        style: TextStyle(
          color: currentTabIndex == 0 ? Colors.white : Colors.white60,
        ),
      ),
    ),
    PopupMenuButton(
      icon: Icon(Icons.more_vert, color: Colors.white),
      itemBuilder:
          (context) => [
            PopupMenuItem(value: 1, child: Text('Settings')),
            PopupMenuItem(value: 2, child: Text('Scales')),
          ],
      onSelected: (value) {},
    ),
  ];
}

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
