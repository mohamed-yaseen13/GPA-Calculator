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
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please provide a Gmail address for recovery purposes.',
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      tempEmail = value;
                      setStateDialog(() {
                        errorText = null;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: currentEmail ?? 'example@gmail.com',
                      errorText: errorText,
                    ),
                  ),
                ],
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
                        errorText = 'Enter a valid email address';
                      });
                      return;
                    }
                    if (!tempEmail.toLowerCase().endsWith('@gmail.com')) {
                      setStateDialog(() {
                        errorText = 'Please provide a Gmail address';
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
