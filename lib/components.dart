import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTexField(IconData icon, String hint, bool obscure) {
  return TextFormField(
    decoration: InputDecoration(
      icon: Icon(
        icon,
        size: 30,
        color: Colors.lightBlue,
      ),
      hintText: hint,
      //labelText: ''
    ),
    style: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    obscureText: obscure,
    //onSaved: (value){},
    //validator: (value){},
    //autocorrect: ,
  );
}

Widget buildButton(String text, IconData icon) {
  return SignInButtonBuilder(
    text: text,
    icon: icon,
    onPressed: () {},
    backgroundColor: Colors.lightBlue,
  );
}

Widget buildAPIButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SignInButton(
        Buttons.Facebook,
        mini: true,
        onPressed: () {},
      ),
      SignInButton(
        Buttons.Twitter,
        mini: true,
        onPressed: () {},
      ),
      SignInButton(
        Buttons.Apple,
        mini: true,
        onPressed: () {},
      ),
      /*
                SignInButtonBuilder(
                  icon: Icons.email,
                  text: "Ignored for mini button",
                  mini: true,
                  onPressed: () {},
                  backgroundColor: Colors.cyan,
                ),
                */
    ],
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
