import 'package:flutter/material.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:tour_guide/widgets/components.dart';
import 'package:tour_guide/screens/signin_UI.dart';
import 'package:tour_guide/main.dart';

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
            image: AssetImage('assets/images/24hrs.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.transparent,
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
              child: BuildSignUp(),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildSignUp extends StatefulWidget {
  @override
  _BuildSignUpState createState() => _BuildSignUpState();
}

class _BuildSignUpState extends State<BuildSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 35, top: 90, right: 35),
        child: (Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildTexField(Icons.email, 'Email', false),
                    buildTexField(Icons.person, 'Username', false),
                    buildTexField(Icons.vpn_key, 'Password', true),
                    buildTexField(Icons.vpn_key, 'Confirm Password', true),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: buildButton('Continue', Icons.email, () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
            ),
            googleButton('Continue with Google'),
            buildAPIButtons(),
            Padding(
                padding: EdgeInsets.only(top: 50, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildFooterText(
                        "Already have an account?", Colors.white, 16),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: buildFooterText('Sign In', Colors.white, 16),
                    ),
                  ],
                )),
          ],
        )));
  }
}
