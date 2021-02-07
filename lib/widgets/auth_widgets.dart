import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:tour_guide/widgets/fonts_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

//////////////////////////////
/// *****Email*****
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

//////////////////////////////
/// *****Password*****
class authPassField extends StatefulWidget {
  TextEditingController _passwordController;
  String _authMode;
  ValueSetter<String> _onSaved;
  authPassField(this._passwordController, this._authMode, this._onSaved);

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
          if (widget._authMode == 'signUp') {
            if (value.length > 12 || value.length < 8) {
              return ('Password must be between 8 and 12 characters');
            } else if (!value.contains(new RegExp(r'[A-Z]'))) {
              return ('passwords must have at least one uppercase letter');
            } else if (!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
              return ('passwords must have at least one special character');
            }
          }

          return null;
        },
        onSaved: widget._onSaved,
      ),
    );
  }
}

//////////////////////////////
/// *****Google*****
Widget googleButton(String text) {
  return SignInButton(
    Buttons.Google,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
    //shape:BeveledRectangleBorder,
    text: text,
    onPressed: () {},
  );
}

//////////////////////////////
/// *****Facebook*****
Widget fbButton(String text) {
  return SignInButton(Buttons.Facebook,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      //shape:BeveledRectangleBorder,
      text: text,
      onPressed: () {});
}
