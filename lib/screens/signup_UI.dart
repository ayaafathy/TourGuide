import 'package:flutter/material.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/widgets/forms_widgets.dart';
import 'package:tour_guide/widgets/signUp_widgets.dart';
import 'package:tour_guide/screens/signin_UI.dart';
import 'package:tour_guide/main.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signUpKey,
        child: Container(
          margin: EdgeInsets.only(left: 35, top: 60, right: 35),
          child: (Column(children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(11))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    emailField(),
                    usernameField(),
                    PasswordField(),
                    ConfirmPassField(),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Builder(builder: (BuildContext context) {
                return buildButton('Continue', Icons.email, () {
                  if (_signUpKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                      new SnackBar(
                        content: Text('Your account is ready!'),
                      ),
                    );
                    Future.delayed(
                        Duration(seconds: 1),
                        () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            ));
                  }
                });
              }),
            ),
            googleButton('Continue with Google'),
            buildAPIButtons(),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildFooterText(
                        "Already have an account?", Colors.white, 16),
                    buildFooterText('Sign In', Colors.white, 16),
                  ],
                ),
              ),
            )
          ])),
        ));
  }
}
