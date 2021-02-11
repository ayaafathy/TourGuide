import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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

Widget fbButton(String text) {
  return SignInButton(Buttons.Facebook,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      //shape:BeveledRectangleBorder,
      text: text,
      onPressed: () {});
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
