import 'package:flutter/material.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';

class AddEventDialog extends StatefulWidget {
  final DateTime date;

  const AddEventDialog({super.key, required this.date});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Event'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  date: widget.date,
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
