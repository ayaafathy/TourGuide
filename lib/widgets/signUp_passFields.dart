import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController passController = TextEditingController();
  bool passVisible;

  /*getPassowrdController() {
    return _PasswordFieldState().passController;
  }*/

  @override
  void initState() {
    super.initState();
    passVisible = false;

    //passController.addListener();
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: passController,
        obscureText: !passVisible,
        decoration: InputDecoration(
            icon: Icon(
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
            contentPadding: const EdgeInsets.all(5.0)),
        style: GoogleFonts.roboto(
          color: Colors.grey[900],
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return ('Enter a Password');
          } else if (value.length > 10) {
            return ('Password too long');
          } else if (value.length < 5) {
            return ('Password too short');
          }
          return null;
        });
  }
}

class ConfirmPassField extends StatefulWidget {
  _ConfirmPassFieldState createState() => _ConfirmPassFieldState();
}

class _ConfirmPassFieldState extends State<ConfirmPassField> {
  bool confirmVisible;
  var password = _PasswordFieldState().passController.text;
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
            icon: Icon(
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
            contentPadding: const EdgeInsets.all(5.0)),
        style: GoogleFonts.roboto(
          color: Colors.grey[900],
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return ('Confirm your password');
          } else if (value != password) {
            return ('Passwords do not match');
          }
          return null;
        });
  }
}
