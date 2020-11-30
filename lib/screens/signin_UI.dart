import 'package:flutter/material.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:tour_guide/widgets/components.dart';
import 'package:tour_guide/screens/signup_UI.dart';
import 'package:tour_guide/main.dart';

void main() {
  runApp(SignIn());
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Login Page',
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
              'Sign in',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: BuildSignIn(),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildSignIn extends StatefulWidget {
  @override
  _BuildSignInState createState() => _BuildSignInState();
}

class _BuildSignInState extends State<BuildSignIn> {
  final _signInKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signInKey,
        child: Container(
            margin: EdgeInsets.only(left: 35, top: 90, right: 35),
            child: (Column(
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(11))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildTexField(Icons.person, 'Username', false,
                            'Enter a Username', 'Invalid Username'),
                        buildTexField(Icons.lock, 'Password', true,
                            'Enter a password', 'Invalid Password'),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Builder(builder: (BuildContext context) {
                    return buildButton('Continue', Icons.email, () {
                      if (_signInKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                          new SnackBar(
                            content: Text('Logged In!'),
                          ),
                        );
                        Future.delayed(
                            Duration(seconds: 2),
                            () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                ));
                      }
                    });
                  }),
                ),
                googleButton('Continue with Google'),
                buildAPIButtons(),
                Padding(
                    padding: EdgeInsets.only(top: 80, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildFooterText(
                            "Don't have an account?", Colors.white, 16),
                        new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child:
                              buildFooterText('Create One!', Colors.white, 14),
                        ),
                      ],
                    )),
              ],
            ))));
  }
}
