import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';
import 'package:gpa_calculator/feature/calendar/ui/widgets/show_menu_on_long_press.dart';

class ShowEventsDialog extends StatelessWidget {
  final DateTime date;
  final List<EventModel> events;
  final void Function([int index]) onAdd;
  final Function(EventModel) onDelete;
  final void Function(EventModel, BuildContext) onCopy;

  const ShowEventsDialog({
    super.key,
    required this.date,
    required this.events,
    required this.onAdd,
    required this.onDelete,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Events on ${date.toLocal().toString().split(' ')[0]}'),
      content: SizedBox(
        width: 300,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: events.length,
          itemBuilder: (context, i) {
            final event = events[i];
            return GestureDetector(
              onLongPressStart: (details) {
                showContextMenu(
                  context: context,
                  position: details.globalPosition,
                  event: event,
                  onDelete: onDelete,
                  index: i,
                  onEdit: onAdd,
                  onCopy: onCopy,
                );
              },
              child: ListTile(
                title: Text(event.title),
                subtitle: Text(event.description ?? ''),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    onDelete(event);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => onAdd(),
          child: Text(events.isEmpty ? 'Add Event' : 'Add Another'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    );
  }
}
