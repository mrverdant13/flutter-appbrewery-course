import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    @required this.hintText,
    @required this.borderColor,
    @required this.onChanged,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: _getInputDecoration(),
    );
  }

  InputDecoration _getInputDecoration() => InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
      );
}
