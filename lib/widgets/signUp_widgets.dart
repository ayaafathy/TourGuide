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
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passVisible = false;
    _passwordController.addListener(() => password);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
      controller: _passwordController,
      validator: (value) {
        if (value.length > 12 || value.length < 8) {
          return ('Password must be between 8 and 12 characters');
        } else if (!value.contains(new RegExp(r'[A-Z]'))) {
          return ('passwords must have at least one uppercase letter');
        } else if (!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          return ('passwords must have at least one special character');
        }
        return null;
      },
      //onChanged: (value) => password = value,
    );
  }
}

class ConfirmPassField extends StatefulWidget {
  _ConfirmPassFieldState createState() => _ConfirmPassFieldState();
}

class _ConfirmPassFieldState extends State<ConfirmPassField> {
  bool confirmVisible;
  final _confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    confirmVisible = false;
  }

  @override
  void dispose() {
    _confirmController.dispose();
    super.dispose();
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
      controller: _confirmController,
      //validator: (value) {
      //  if (_confirmController.text !=
      //      _PasswordFieldState()._passwordController.text) {
      //    return ('Passwords do not match');
      //  }
      // return null;
      //},
    );
  }
}
