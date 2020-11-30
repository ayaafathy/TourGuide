import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tour_guide/widgets/fonts_style.dart';

Widget emailField() {
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Invalid Email'),
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
        hintStyle: hintStyle(),
        contentPadding: const EdgeInsets.all(5.0)),
    style: textStyle(),
    validator: emailValidator,
  );
}

class PasswordField extends StatefulWidget {
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passVisible;
  String password;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    RangeValidator(
        min: 8,
        max: 12,
        errorText: 'Password must be between 8 and 12 characters'),
    PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,12}$',
        errorText: 'Passwords must have at least one uppercase letter')
  ]);

  @override
  void initState() {
    super.initState();
    passVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !passVisible,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            size: 25,
            color: Colors.grey[900],
          ),
          suffixIcon: IconButton(
            icon: Icon(
              passVisible ? Icons.visibility : Icons.visibility_off,
              size: 25,
              color: Colors.grey[900],
            ),
            onPressed: () {
              setState(() {
                passVisible = !passVisible;
              });
            },
          ),
          hintText: 'Password',
          hintStyle: hintStyle(),
          //helperText: 'Password must be between 8 and 12 characters',
          //helperStyle: TextStyle(color: Colors.red, fontSize: 15),
          contentPadding: const EdgeInsets.all(5.0)),
      style: textStyle(),
      validator: passwordValidator,
      onChanged: (value) => password = value,
    );
  }
}

class ConfirmPassField extends StatefulWidget {
  _ConfirmPassFieldState createState() => _ConfirmPassFieldState();
}

class _ConfirmPassFieldState extends State<ConfirmPassField> {
  bool confirmVisible;

  @override
  void initState() {
    super.initState();
    confirmVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !confirmVisible,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            size: 25,
            color: Colors.grey[900],
          ),
          suffixIcon: IconButton(
            icon: Icon(
              confirmVisible ? Icons.visibility : Icons.visibility_off,
              size: 25,
              color: Colors.grey[900],
            ),
            onPressed: () {
              setState(() {
                confirmVisible = !confirmVisible;
              });
            },
          ),
          hintText: 'Confirm password',
          hintStyle: hintStyle(),
          contentPadding: const EdgeInsets.all(5.0)),
      style: textStyle(),
      validator: (val) => MatchValidator(errorText: 'Passwords do not match')
          .validateMatch(val, _PasswordFieldState().password),
    );
  }
}
