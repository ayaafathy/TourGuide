import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/fonts_style.dart';

class SignInPassField extends StatefulWidget {
   TextEditingController controller;
   SignInPassField(this.controller);

  _SignInPassFieldState createState() => _SignInPassFieldState();
}

class _SignInPassFieldState extends State<SignInPassField> {
  bool passVisible;

  @override
  void initState() {
    super.initState();
    passVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: TextFormField(
        controller: widget.controller,
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
          return null;
        },
      ),
    );
  }
}
