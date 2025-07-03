import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';

class AddRangeEventDialog extends StatefulWidget {
  final DateTime start;
  final DateTime end;

  const AddRangeEventDialog({
    super.key,
    required this.start,
    required this.end,
  });

  @override
  State<AddRangeEventDialog> createState() => _AddRangeEventDialogState();
}

class _AddRangeEventDialogState extends State<AddRangeEventDialog> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Event for Range'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'From: ${widget.start.toLocal().toString().split(' ')[0]} '
            'To: ${widget.end.toLocal().toString().split(' ')[0]}',
          ),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              Navigator.pop(
                context,
                EventModel(
                  date: widget.start, // You can use this as a template
                  title: _titleController.text,
                  description: _descController.text,
                ),
              );
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
