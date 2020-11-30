import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

Widget emailField() {
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Invalid Email')
  ]);

  return TextFormField(
    obscureText: false,
    decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          size: 25,
          color: Colors.grey[900],
        ),
        hintText: 'Email',
        contentPadding: const EdgeInsets.all(5.0)),
    style: GoogleFonts.roboto(
      color: Colors.grey[900],
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    validator: emailValidator,
  );
}
