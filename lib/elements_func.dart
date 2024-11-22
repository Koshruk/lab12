import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin Elements{
  static const Widget spacer = SizedBox(height: 20);
  static const Widget spacer15 = SizedBox(height: 15);

  Widget textField({required String text, bool validatePassword = false, bool validateEmail = false, required TextEditingController controller}) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: (value){
            if (value == null || value.isEmpty){
              return "This field can not be empty";
            }
            if (validatePassword == true){
              final passwordError = _validatePasswordLength(value);
              if (passwordError != null) return passwordError;
            }
            if (validateEmail == true){
              final emailError = _validateEmail(value);
              if (emailError != null) return emailError;
            }
            return null;
          },
        ),
      ],
    );
  }

  String? _validatePasswordLength(String? value){
    if (value == null || value.length < 7){
      return "Password must be at least 7 characters long";
    }
    return null;
  }

  String? _validateEmail(String? value){
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || !emailRegex.hasMatch(value)){
      return "This field must contain email";
    }
    return null;
  }

  Widget backButton(context){
    return OutlinedButton(
      onPressed: () => {
        Navigator.pop(context)
      },
      child: const Text(
        "Back",
      ),
    );
  }
}