import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTexField(IconData icon, String hint, bool obscure) {
  return TextFormField(
    decoration: InputDecoration(
        icon: Icon(
          icon,
          size: 25,
          color: Colors.black,
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.all(5.0)),
        
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

Widget buildButton(String text, IconData icon, onPress) {
  return SignInButtonBuilder(
    text: (text),
    fontSize: 14,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    icon: icon,
    textColor: Colors.grey[600],
    iconColor: Colors.black,
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

      /* SignInButtonBuilder(
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
