import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/routing/app_routes.dart';

List<Widget> buildAppBarActions({
  required BuildContext context,
  required int currentTabIndex,
  required VoidCallback onSelect,
}) {
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
      icon: Icon(Icons.more_vert),
      itemBuilder:
          (context) => [
            PopupMenuItem(value: 1, child: Text('Settings')),
            PopupMenuItem(value: 2, child: Text('Scales')),
          ],
      onSelected: (value) async {
        if (value == 1) {
          context.pushNamed(AppRoutes.settingsScreen);
        }
        if (value == 2) {
          context.pushNamed(AppRoutes.scalesScreen);
        }
      },
    ),
  ];
}
