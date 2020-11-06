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
            image: AssetImage('images/24hrs.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 35,
              ),
              //  tooltip: '',
              onPressed: () {},
            ),
            title: Text(
              'Sign in',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: BuildForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 25, top: 80, right: 25),
        child: (Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 10),
                color: Colors.white70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: buildTexField(Icons.person, 'Username', false),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: buildTexField(Icons.vpn_key, 'Password', true),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 2),
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
                padding: EdgeInsets.only(top: 60, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "DON'T HAVE AN ACCOUNT? ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'CREATE ONE!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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

  SignInButtonBuilder buildButton(String text, IconData icon) {
    return SignInButtonBuilder(
      text: text,
      icon: icon,
      onPressed: () {},
      backgroundColor: Colors.lightBlue,
    );
  }
}
