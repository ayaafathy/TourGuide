import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:tour_guide/components.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'SignUp Page',
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
              'Sign up',
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

class BuildForm extends StatefulWidget {
  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 25, top: 90, right: 25),
        child: (Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 10),
                color: Colors.white70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Components().buildTexField(Icons.email, 'Email', false),
                    Components().buildTexField(Icons.person, 'Username', false),
                    Components().buildTexField(Icons.vpn_key, 'Password', true),
                    Components()
                        .buildTexField(Icons.vpn_key, 'Confirm Password', true),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Components().buildButton('Continue', Icons.email),
            ),
            SignInButton(
              Buttons.Google,
              text: 'Continue with Google',
              onPressed: () {},
            ),
            Components().buildAPIButtons(),
            Padding(
                padding: EdgeInsets.only(top: 50, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Components().buildFooterText(
                        "Already have an account?", Colors.white, 18),
                    Components().buildFooterText('Sign In', Colors.white, 16),
                  ],
                )),
          ],
        )));
  }
}
