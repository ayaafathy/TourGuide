import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/fonts_style.dart';
import 'package:form_field_validator/form_field_validator.dart';

Widget authEmailField(TextEditingController controller, onSaved) {
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Invalid Email format'),
  ]);

  return Padding(
    padding: EdgeInsets.all(5.0),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
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
      onSaved: onSaved,
    ),
  );
}

class authPassField extends StatefulWidget {
  TextEditingController _passwordController;
  authPassField(this._passwordController);

  _authPassFieldState createState() => _authPassFieldState();
}

class _authPassFieldState extends State<authPassField> {
  bool passVisible;

  @override
  void initState() {
    super.initState();
    passVisible = false;
  }

  @override
  void dispose() {
    widget._passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: widget._passwordController,
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
            contentPadding: const EdgeInsets.all(5.0)),
        style: textStyle(),
        validator: (value) {
          if (value.isEmpty) {
            return ('Password is required');
          }
          if (value.length < 8) {
            return ('Password is too short');
          }
          return null;
        },
        onSaved: (value) {},
      ),
    );
  }
}
