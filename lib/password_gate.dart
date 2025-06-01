import 'package:flutter/material.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';

class PasswordGate extends StatefulWidget {
  final Widget child;
  const PasswordGate({super.key, required this.child});

  @override
  State<PasswordGate> createState() => _PasswordGateState();
}

class _PasswordGateState extends State<PasswordGate> {
  bool _unlocked = false;

  @override
  void initState() {
    super.initState();
    _checkPassword();
  }

  Future<void> _checkPassword() async {
    final passwordEnabled = await PrefsHelper.isPasswordEnabled();
    if (!passwordEnabled) {
      // If password is disabled, unlock immediately
      setState(() => _unlocked = true);
      return;
    }

    final password = await PrefsHelper.getPassword();
    if (password == null || password.isEmpty) {
      // If no password is set, unlock immediately
      setState(() => _unlocked = true);
      return;
    }

    await Future.delayed(Duration.zero);
    await _showPasswordDialog(password);
  }

  Future<void> _showPasswordDialog(String correctPassword) async {
    String input = '';
    bool wrong = false;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Enter Password'),
              content: TextField(
                autofocus: true,
                obscureText: true,
                onChanged: (val) {
                  input = val;
                  setStateDialog(() {
                    wrong = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  errorText: wrong ? 'Incorrect password' : null,
                ),
                onSubmitted: (_) {
                  if (input == correctPassword) {
                    Navigator.pop(context);
                  } else {
                    setStateDialog(() {
                      wrong = true;
                    });
                  }
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (input == correctPassword) {
                      Navigator.pop(context);
                    } else {
                      setStateDialog(() {
                        wrong = true;
                      });
                    }
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
    setState(() => _unlocked = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_unlocked) {
      return const SizedBox.shrink();
    }
    return widget.child;
  }
}
