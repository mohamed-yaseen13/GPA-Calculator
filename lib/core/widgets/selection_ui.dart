import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';

Widget buildSelectionUI({
  required BuildContext context,
  required VoidCallback onCancelSelection,
  required VoidCallback onSelectAll,
  required VoidCallback onDelete,
  required int selectedItem,
  required String content,
}) {
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
            onPressed:
                selectedItem == 0
                    ? null
                    : () => showDeleteDialog(
                      context: context,
                      content: content,
                      onConfirm: onDelete,
                      onCancel: onCancelSelection,
                    ),
          ),
        ],
      ),
    ),
  );
}

Future<void> showDeleteDialog({
  required BuildContext context,
  required String content,
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text('Delete $content'),
          content: Text('Do you actually need to delete these $content'),
          actions: [
            TextButton(onPressed: () => context.pop(false), child: Text('No')),
            TextButton(onPressed: () => context.pop(true), child: Text('Yes')),
          ],
        ),
  );
  if (result == true) {
    onConfirm();
  }
  onCancel();
}
