import 'package:flutter/material.dart';
import 'package:tour_guide/screens/homepage.dart';
import 'package:tour_guide/NotUsed/forms_widgets.dart';
import 'package:tour_guide/NotUsed/signIn_widgets.dart';
import 'package:tour_guide/NotUsed/signup_UI.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.transparent,
        title: Text(
          'Sign In',
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
    );
  }
}

class BuildSignIn extends StatefulWidget {
  @override
  _BuildSignInState createState() => _BuildSignInState();
}

class _BuildSignInState extends State<BuildSignIn> {
  final _signInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInKey,
      child: Container(
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
                    authEmailField(_emailController, (value) {}),
                    AuthPassField(_passwordController)
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Builder(builder: (BuildContext context) {
                return buildButton(
                  'Continue',
                  Icons.email,
                  () async {
                    if (_signInKey.currentState.validate()) {
                      /*
                      print(_emailController.text);
                      print(_passwordController.text);
                      */
                      // ignore: omit_local_variable_types

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Logged In!'),
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
                  },
                );
                /* 
                child: Builder(builder: (BuildContext context) {
                return buildButton(
                  'Continue',
                  Icons.email,
                  () async {
                    if (_signInKey.currentState.validate()) {
                      /*
                      print(_emailController.text);
                      print(_passwordController.text);
                      */
                      // ignore: omit_local_variable_types
                      bool shouldNavigate = await signIn(
                          _emailController.text, _passwordController.text);
                      print(shouldNavigate);
                      if (shouldNavigate) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Logged In!'),
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
                    }
                  },
                );
              }),
                 */
              }),
            ),
            googleButton('Sign In with Google'),
            fbButton('Sign In with Facebook'),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: GestureDetector(
                onTap: () {},
                child: buildFooterText('Forget Password?', Colors.white, 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildFooterText("Don't have an account?", Colors.white, 16),
                    buildFooterText('Create One!', Colors.white, 14),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
