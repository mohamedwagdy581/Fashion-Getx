import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final IconData icon;
  CustomTextfield(this.hint, this.icon);
  String? _errorMessage(String str) {
    switch (hint) {
      case 'Enter your Name':
        return 'Name is Empty';
      case 'Enter your Email':
        return 'Email is Empty';
      case 'Enter your Password':
        return 'Password is Empty';
      case 'Verify your Password':
        return 'Password is Empty';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            // ignore: missing_return, missing_return
            return _errorMessage(hint);
          }
        },
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
