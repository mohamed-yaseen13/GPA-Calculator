import 'package:flutter/material.dart';

class PasswordHintDialogs {
  static Future<String?> showHintDialog({
    required BuildContext context,
    String? currentHint,
  }) async {
    String tempHint = '';
    return await showDialog<String>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Enter Password Hint'),
            content: TextField(
              autofocus: true,
              onChanged: (value) => tempHint = value,
              decoration: InputDecoration(hintText: currentHint ?? 'Hint'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (tempHint.isNotEmpty) {
                    Navigator.pop(context, tempHint);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }
}
