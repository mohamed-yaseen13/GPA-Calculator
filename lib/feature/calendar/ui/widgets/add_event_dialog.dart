import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/calendar/data/models/event_model.dart';

class AddEventDialog extends StatefulWidget {
  final DateTime date;
  final EventModel? existingEvent;

  const AddEventDialog({super.key, required this.date, this.existingEvent});

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  Color selectedColor = Colors.blue[100]!;

  final List<Color> availableColors = [
    Colors.blue[100]!,
    Colors.red[100]!,
    Colors.green[100]!,
    Colors.orange[100]!,
    Colors.purple[100]!,
  ];

  @override
  void initState() {
    super.initState();

    if (widget.existingEvent != null) {
      _titleController.text = widget.existingEvent!.title;
      _descController.text = widget.existingEvent!.description ?? '';
      selectedColor = widget.existingEvent!.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingEvent != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Event' : 'Add Event'),
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
          verticalSpace(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                availableColors.map((color) {
                  final isSelected = selectedColor == color;
                  return GestureDetector(
                    onTap: () => setState(() => selectedColor = color),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                }).toList(),
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
                  color: selectedColor,
                ),
              );
            }
          },
          child: Text(isEditing ? 'Edit' : 'Add'),
        ),
      ],
    );
  }
}
