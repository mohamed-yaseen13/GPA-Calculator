import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';

class ShowEventsDialog extends StatelessWidget {
  final DateTime date;
  final List<EventModel> events;
  final VoidCallback onAdd;
  final Function(EventModel) onDelete;

  const ShowEventsDialog({
    super.key,
    required this.date,
    required this.events,
    required this.onAdd,
    required this.onDelete,
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
            return ListTile(
              title: Text(event.title),
              subtitle: Text(event.description ?? ''),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  onDelete(event);
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: onAdd,
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
