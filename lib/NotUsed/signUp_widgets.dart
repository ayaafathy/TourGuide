import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tour_guide/widgets/fonts_style.dart';

Widget emailField(TextEditingController controller) {
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Invalid Email format'),
  ]);

  return Padding(
    padding: EdgeInsets.all(5.0),
    child: TextFormField(
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
    ),
  );
}

class signUpPasswordField extends StatefulWidget {
  TextEditingController _passwordController;
  signUpPasswordField(this._passwordController);

  _signUpPasswordFieldState createState() => _signUpPasswordFieldState();
}

class _signUpPasswordFieldState extends State<signUpPasswordField> {
  bool passVisible;
  String password;

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
            //helperText: 'Password must be between 8 and 12 characters',
            //helperStyle: TextStyle(color: Colors.red, fontSize: 15),
            contentPadding: const EdgeInsets.all(5.0)),
        style: textStyle(),
        validator: (value) {
          if (value.isEmpty) {
            return ('Password is required');
          } else if (value.length > 12 || value.length < 8) {
            return ('Password must be between 8 and 12 characters');
          } else if (!value.contains(new RegExp(r'[A-Z]'))) {
            return ('passwords must have at least one uppercase letter');
          } else if (!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            return ('passwords must have at least one special character');
          }
          return null;
        },
      ),
    );
  }
}

class ConfirmPassField extends StatefulWidget {
  TextEditingController _confirmController;
  bool authenticationMode;
  //ConfirmPassField(this._confirmController);
  //ConfirmPassField(this._confirmController, this.authenticationMode);

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
  void dispose() {
    widget._confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
        ///CHECK
        enabled: widget.authenticationMode,
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
        controller: widget._confirmController,
      ),
    );
  }
}
