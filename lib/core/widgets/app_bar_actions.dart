import 'package:flutter/material.dart';

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
