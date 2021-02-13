import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_guide/widgets/fonts_style.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:tour_guide/widgets/auth_widgets.dart';
import 'package:tour_guide/models/http_exception.dart';
import 'package:tour_guide/providers/authentication.dart';

enum AuthenticationMode { signUp, signIn }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.transparent,
        title: Text(
          'Welcome!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: AuthForm(),
          ),
        ),
      ),
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key key,
  }) : super(key: key);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Confirm password visibility icon
  bool confirmVisible;

  /// Authentication
  AuthenticationMode _authenticationMode = AuthenticationMode.signIn;
  Map<String, String> _authenticationData = {
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
  Future<void> _continue() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authenticationMode == AuthenticationMode.signIn) {
        // Log user in
        await Provider.of<Authentication>(context, listen: false).signIn(
          _authenticationData['email'].trim(),
          _authenticationData['password'].trim(),
        );
      } else {
        // Sign user up
        await Provider.of<Authentication>(context, listen: false).signUp(
          _authenticationData['email'].trim(),
          _authenticationData['password'].trim(),
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
      print('**********************************************');
      print(e);
      const errorMsg = 'Something went wrong. Please try again later.';
      _showError(errorMsg);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authenticationMode == AuthenticationMode.signIn) {
      setState(() {
        _authenticationMode = AuthenticationMode.signUp;
      });
    } else {
      setState(() {
        _authenticationMode = AuthenticationMode.signIn;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    /// Confirm password visibility icon
    confirmVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 35, top: 90, right: 35),
          child: (Column(
            children: <Widget>[
              Container(
                  width: deviceSize.width * 0.8,
                  padding:
                      EdgeInsets.only(left: 5, top: 2, right: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(11))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /// Email & Password Widgets from 'auth_widgets.dart' in 'Widgets' directory
                      AuthEmailField(_emailController, (value) {
                        //value = value.trim();
                        _authenticationData['email'] = value;
                      }),
                      if (_authenticationMode == AuthenticationMode.signUp)
                        AuthPassField(_passwordController, 'signUp', (value) {
                          //value = value.trim();
                          _authenticationData['password'] = value;
                        }),
                      if (_authenticationMode == AuthenticationMode.signIn)
                        AuthPassField(_passwordController, 'signIn', (value) {
                          //value = value.trim();
                          _authenticationData['password'] = value;
                        }),
                      if (_authenticationMode == AuthenticationMode.signUp)
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: TextFormField(
                            ///CHECK
                            enabled: _authenticationMode ==
                                AuthenticationMode.signUp,
                            obscureText: !confirmVisible,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 25,
                                  color: Colors.grey[900],
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    confirmVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 25,
                                    color: Colors.grey[900],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      confirmVisible = !confirmVisible;
                                    });
                                  },
                                ),
                                hintText: 'Confirm password',
                                hintStyle: hintStyle(),
                                contentPadding: const EdgeInsets.all(5.0)),
                            style: textStyle(),
                            validator:
                                _authenticationMode == AuthenticationMode.signUp
                                    ? (value) {
                                        if (value != _passwordController.text) {
                                          return ('Passwords do not match');
                                        }
                                        return null;
                                      }
                                    : null,
                          ),
                        ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: SignInButtonBuilder(
                  text: ('Continue'),
                  fontSize: 14,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  icon: Icons.email,
                  textColor: Colors.grey[600],
                  iconColor: Colors.grey[900],
                  onPressed: _continue,
                  backgroundColor: Colors.white,
                ),
              ),
              googleButton('Continue with Google'),
              fbButton('Continue with Facebook'),
              if (_authenticationMode == AuthenticationMode.signIn)
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 20),
                  child: new GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              if (_isLoading)
                CircularProgressIndicator()
              else
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 8),
                  child: new GestureDetector(
                    onTap: _switchAuthMode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _authenticationMode == AuthenticationMode.signIn
                              ? "Don't have an account?"
                              : 'Already have an account?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          _authenticationMode == AuthenticationMode.signIn
                              ? 'Create One!'
                              : 'Sign In',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )),
        ),
      ),
    );
  }
}
