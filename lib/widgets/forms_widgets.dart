import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:tour_guide/widgets/fonts_style.dart';

Widget usernameField() {
  return TextFormField(
    obscureText: false,
    decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          size: 25,
          color: Colors.grey[900],
        ),
        hintText: 'Username',
        hintStyle: hintStyle(),
        contentPadding: const EdgeInsets.all(5.0)),
    style: textStyle(),
    validator: (value) {
      if (value.isEmpty) {
        return ('Username is required');
      } else if (value.length > 10) {
        return ('Invalid username');
      }
      return null;
    },
  );
}

Widget buildFooterText(String tex, Color color, double size) {
  return Text(
    tex,
    textAlign: TextAlign.center,
    style: GoogleFonts.roboto(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget buildButton(String text, IconData icon, onPress) {
  return SignInButtonBuilder(
    text: (text),
    fontSize: 14,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    icon: icon,
    textColor: Colors.grey[600],
    iconColor: Colors.grey[900],
    onPressed: onPress,
    backgroundColor: Colors.white,
  );
}

Widget googleButton(String text) {
  return SignInButton(
    Buttons.Google,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
    //shape:BeveledRectangleBorder,
    text: text,
    onPressed: () {},
  );
}

Widget buildAPIButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SignInButton(
        Buttons.Twitter,
        mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        onPressed: () {},
      ),
      SignInButton(
        Buttons.Facebook,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        mini: true,
        onPressed: () {},
      ),
      SignInButton(
        Buttons.Tumblr,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        mini: true,
        onPressed: () {},
      ),

      // SignInButtonBuilder(
      //            icon: Icons.email,
      //            text: "Ignored for mini button",
      //            mini: true,
      //            onPressed: () {},
      //            backgroundColor: Colors.cyan,
      //          ),
      //
    ],
  );
}
