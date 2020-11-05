import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/citylights.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.lightBlue,
                size: 35,
              ),
              //  tooltip: '',
              onPressed: () {},
            ),
            title: Text(
              'Login',
              style: TextStyle(
                color: Colors.lightBlue,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: (Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25),
              child: buildTexField(Icons.person, 'Username', false),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: buildTexField(Icons.vpn_key, 'Password', true),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 2),
              child: buildButton('Continue', Icons.email),
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () {},
            ),
            Row(
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
            ),
            Padding(
                padding: EdgeInsets.only(top: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "DON'T HAVE AN ACCOUNT? ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.lightBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'CREATE ONE!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.lightBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )),
          ],
        )));
  }

  TextFormField buildTexField(IconData icon, String hint, bool obscure) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          icon,
          size: 35,
          color: Colors.lightBlue,
        ),
        hintText: hint,
        //labelText: ''
      ),
      obscureText: obscure,
      //onSaved: (value){},
      //validator: (value){},
      //autocorrect: ,
    );
  }

  SignInButtonBuilder buildButton(String text, IconData icon) {
    return SignInButtonBuilder(
      text: text,
      icon: icon,
      onPressed: () {},
      backgroundColor: Colors.lightBlue,
    );
  }
}
