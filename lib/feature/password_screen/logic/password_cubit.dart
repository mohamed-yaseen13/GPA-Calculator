import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpa_calculator/core/helpers/prefs_helper.dart';
import 'package:gpa_calculator/feature/password_screen/logic/password_state.dart';
import 'package:http/http.dart' as http;

class PasswordCubit extends Cubit<PasswordState> {
  static const int passwordLength = 4;

  PasswordCubit() : super(const PasswordState());

  Future<void> addDigit(String digit, Function onPasswordCorrect) async {
    if (state.input.length < passwordLength) {
      final newInput = state.input + digit;
      emit(state.copyWith(input: newInput, wrong: false));

      if (newInput.length == passwordLength) {
        try {
          final correctPassword = await PrefsHelper.getPassword();
          if (newInput == correctPassword) {
            emit(state.copyWith(input: '', wrong: false));
            onPasswordCorrect();
          } else {
            emit(state.copyWith(input: '', wrong: true));
          }
        } catch (e) {
          emit(state.copyWith(input: '', wrong: true));
        }
      }
    }
  }

  void deleteLastDigit() {
    if (state.input.isNotEmpty) {
      emit(
        state.copyWith(
          input: state.input.substring(0, state.input.length - 1),
          wrong: false,
        ),
      );
    }
  }

  Future<bool> isPasswordEnabled() async {
    try {
      return await PrefsHelper.isPasswordEnabled();
    } catch (e) {
      return false;
    }
  }

  Future<void> checkPasswordEnabled(Function onPasswordDisabled) async {
    final passwordEnabled = await isPasswordEnabled();
    if (!passwordEnabled) {
      onPasswordDisabled();
    }
  }

  Future<void> sendPasswordToRecoveryEmail(BuildContext context) async {
    try {
      final recoveryEmail = await PrefsHelper.getRecoveryEmail();
      if (recoveryEmail == null || recoveryEmail.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No recovery email is set.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final password = await PrefsHelper.getPassword();

      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

      await http.post(
        url,
        headers: {
          'origin': 'http:/localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "service_id": "service_cnz6vts",
          "template_id": "template_8810hz2",
          "user_id": "EvujsAAehpMxYQef_",
          "template_params": {
            "user_password": password,
            "to_email": recoveryEmail,
          },
        }),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password sent to $recoveryEmail successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send password: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
