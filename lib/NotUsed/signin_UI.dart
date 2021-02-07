import 'package:flutter/material.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/NotUsed/forms_widgets.dart';
import 'package:tour_guide/NotUsed/signIn_widgets.dart';
import 'package:tour_guide/NotUsed/signup_UI.dart';
import 'package:tour_guide/services/flutterfire.dart';
import 'package:tour_guide/models/http_exception.dart';
import 'package:tour_guide/services/authentication.dart';
import 'package:provider/provider.dart';

enum AuthenticationMode { SignUp, SignIn }

/*
class SignIn extends StatelessWidget {
  //static const routeName = '/SignIn';
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
*/
class BuildSignIn extends StatefulWidget {
  @override
  _BuildSignInState createState() => _BuildSignInState();
}

class _BuildSignInState extends State<BuildSignIn> {
  final _signInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Authentication
  AuthenticationMode _authMode = AuthenticationMode.SignIn;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  /// Loading indicator
  var _isLoading = false;

  /// Error Handling
  /// TODO: style the dialog
  void _showError(String errorMsg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Something went wrong!'),
              content: Text(errorMsg),
              //elevation: Elevation
              //background
              actions: <Widget>[
                FlatButton(
                  child: Text('Try again'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ));
  }

  /// 'continue' button onPressed function
  /*
  Future<void> _continue() async {
    if (!_signInKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _signInKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthenticationMode.SignIn) {
        // Log user in
        await Provider.of<Authentication>(context, listen: false).signIn(
          _authData['email'],
          _authData['password'],
        );
      } else {
        // Sign user up
        await Provider.of<Authentication>(context, listen: false).signUp(
          _authData['email'],
          _authData['password'],
        );
      }
    } on HttpException catch (e) {
      /// TODO: Check other conditions & edit error messages
      var errorMsg = 'Authentication failed';
      if (e.toString().contains('EMAIL_EXISTS')) {
        errorMsg = 'This email address is already in use.';
      } else if (e.toString().contains('INVALID_EMAIL')) {
        errorMsg = 'This is not a valid email address';
      } else if (e.toString().contains('WEAK_PASSWORD')) {
        errorMsg = 'This password is too weak.';
      } else if (e.toString().contains('EMAIL_NOT_FOUND')) {
        errorMsg = 'Could not find a user with that email.';
      } else if (e.toString().contains('INVALID_PASSWORD')) {
        errorMsg = 'Invalid password.';
      }
      _showError(errorMsg);
    } catch (e) {
      const errorMsg = 'Something went wrong. Please try again later.';
      _showError(errorMsg);
    }
    setState(() {
      _isLoading = false;
    });
  }
  */

  /* 
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }
  */

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
                    authPassField(_passwordController)
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Builder(builder: (BuildContext context) {
                return buildButton(
                  'Continue',
                  Icons.email,
                  () async {
                    if (!_signInKey.currentState.validate()) {
                      return;
                    }
                    print(_emailController.text);
                    print(_passwordController.text);
                    _signInKey.currentState.save();
                    setState(() {
                      _isLoading = true;
                    });
                    try {
                      await Provider.of<Authentication>(context, listen: false)
                          .signIn(
                        _authData['email'],
                        _authData['password'],
                      );

                      /// TODO: Check other conditions & edit error messages
                    } on HttpException catch (e) {
                      var errorMsg = 'Authentication failed';
                      if (e.toString().contains('INVALID_EMAIL')) {
                        errorMsg = 'This is not a valid email address';
                      } else if (e.toString().contains('EMAIL_NOT_FOUND')) {
                        errorMsg = 'Could not find a user with that email.';
                      } else if (e.toString().contains('INVALID_PASSWORD')) {
                        errorMsg = 'Invalid password.';
                      }
                      _showError(errorMsg);
                    } catch (e) {
                      const errorMsg =
                          'Something went wrong. Please try again later.';
                      _showError(errorMsg);
                      print(e);
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  },
                );
              }),
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
                      bool shouldNavigate = await signIn(
                          _emailController.text, _passwordController.text);
                      print(shouldNavigate);
                      if (shouldNavigate) {
                        Scaffold.of(context).showSnackBar(
                          new SnackBar(
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
            ),
            googleButton('Sign In with Google'),
            fbButton('Sign In with Facebook'),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: new GestureDetector(
                onTap: () {},
                child: buildFooterText('Forget Password?', Colors.white, 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22, bottom: 10),
              child: new GestureDetector(
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
