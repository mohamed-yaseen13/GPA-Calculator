import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/constants/app_constants.dart';
import 'package:gpa_calculator/core/helpers/extensions.dart';
import 'package:gpa_calculator/core/helpers/spacing.dart';
import 'package:gpa_calculator/feature/timetable/data/models/time_slot_model.dart';

class AddAppointmentDialog extends StatefulWidget {
  final String day;
  final String interval;
  final TimeSlotModel? slot;

  const AddAppointmentDialog({
    super.key,
    required this.day,
    required this.interval,
    this.slot,
  });

  @override
  State<AddAppointmentDialog> createState() => _AddAppointmentDialogState();
}

class _AddAppointmentDialogState extends State<AddAppointmentDialog> {
  late final TextEditingController _contentController;
  String _selectedType = '--';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _contentController = TextEditingController(
      text: widget.slot?.content ?? '',
    );
    _selectedType = widget.slot?.type ?? '--';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.slot != null;

    return AlertDialog(
      title: Text(
        isEditing
            ? 'Edit Appointment'
            : 'Add Apointment at ${widget.day}-${widget.interval}',
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedType == '--' ? null : _selectedType,
              decoration: const InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(),
              ),
              items:
                  AppConstants.appointmentTypes
                      .map(
                        (type) => DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
              validator:
                  (value) =>
                      value == null || value == '--'
                          ? 'Please select a type'
                          : null,
            ),
            verticalSpace(12),
            TextFormField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 2,
              validator:
                  (value) =>
                      value == null || value.trim().isEmpty
                          ? 'Content cannot be empty'
                          : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.pop(
                TimeSlotModel(
                  content: _contentController.text,
                  day: widget.day,
                  interval: widget.interval,
                  type: _selectedType,
                ),
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
