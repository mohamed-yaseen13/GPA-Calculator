import 'package:flutter/material.dart';

class RecoveryEmailDialogs {
  static Future<String?> showEmailDialog({
    required BuildContext context,
    String? currentEmail,
  }) async {
    String tempEmail = '';
    String? errorText;

    return await showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Enter Recovery Email'),
              content: TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  tempEmail = value;
                  setStateDialog(() {
                    errorText = null;
                  });
                },
                decoration: InputDecoration(
                  hintText: currentEmail ?? 'Email',
                  errorText: errorText,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(tempEmail)) {
                      setStateDialog(() {
                        errorText = 'Enter a valid email';
                      });
                      return;
                    }
                    Navigator.pop(context, tempEmail);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
