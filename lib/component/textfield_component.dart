import 'package:flutter/material.dart';

class TextfieldComponent extends StatelessWidget {
  final controller;
  final String labelText;
  final bool isEmailField;
  final TextAlign textAlign;
  final TextInputType textInputType;
  const TextfieldComponent(
      {super.key,
      required this.controller,
      required this.labelText,
      this.isEmailField = false,
      this.textAlign = TextAlign.start,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        textAlign: textAlign,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 14,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF0493AE)),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF0493AE)),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Mohon isi $labelText ini";
          } else if (isEmailField && !isEmail(value.trim())) {
            return "Format email harus sesuai";
          }
          return null;
        },
      ),
    );
  }

  //* Jika anda perlu validasi email pakai di bawah ini. Jika tidak silahkan comment fungsi isEmail
  // awal check email
  bool isEmail(String value) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(value);
  }
  // akhir check email
}
