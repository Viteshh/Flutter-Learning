import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefix;
  final String? Function(String?)? validator;

  MyTextField(
      {required this.controller,
      required this.labelText,
      required this.prefix,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // key: UniqueKey(),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          labelText: labelText,
          // ignore: unnecessary_null_comparison
          prefixIcon: prefix != null ? Icon(prefix) : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 250, 250, 250)))),
    );
  }
}

class PasswordFeild extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefix;
  final IconData suffix;
  final String? Function(String?)? validator;

  PasswordFeild(
      {required this.controller,
      required this.labelText,
      required this.prefix,
      required this.suffix,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // key: UniqueKey(),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          labelText: labelText,
          // ignore: unnecessary_null_comparison
          prefixIcon: prefix != null ? Icon(prefix) : null,
          suffixIcon: suffix != null ? Icon(suffix) : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 250, 250, 250)))),
    );
  }
}

class UserNameField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefix;
  final String? Function(String?)? validator;
  // final String? Function(String?)? onFieldSubmitted;

  UserNameField({
    required this.controller,
    required this.labelText,
    required this.prefix,
    required this.validator,
    // required this.onFieldSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // key: UniqueKey(),
      controller: controller,
      validator: validator,
      // onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          labelText: labelText,
          // ignore: unnecessary_null_comparison
          prefixIcon: prefix != null ? Icon(prefix) : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 250, 250, 250)))),
    );
  }
}
