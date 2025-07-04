import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/feature/calendar/ui/widgets/show_copy_calendar_dialog.dart';

void showContextMenu({
  required BuildContext context,
  required Offset position,
  required EventModel event,
  required Function(EventModel) onDelete,
  required int index,
  required void Function(int index) onEdit,
  required void Function(EventModel event, BuildContext context) onCopy,
}) async {
  final selected = await showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      position.dx,
      position.dy,
    ),
    items: [
      const PopupMenuItem(value: 'copy', child: Text('Copy')),
      const PopupMenuItem(value: 'edit', child: Text('Edit')),
      const PopupMenuItem(value: 'delete', child: Text('Delete')),
    ],
  );

  switch (selected) {
    case 'copy':
      showCopyCalendarDialog(
        context: context,
        originalEvent: event,
        onPaste: (DateTime newDate) {
          onCopy(event.copyWith(date: newDate), context);
        },
      );
      break;
    case 'edit':
      onEdit(index);
      break;
    case 'delete':
      onDelete(event);
      Navigator.pop(context);
      break;
  }
}
