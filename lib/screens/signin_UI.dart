import 'package:flutter/material.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/widgets/forms_widgets.dart';
import 'package:tour_guide/widgets/signIn_passField.dart';
import 'package:tour_guide/screens/signup_UI.dart';
import 'package:tour_guide/services/flutterfire.dart';

void main() {
  runApp(SignIn());
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      home: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/redstreet.jpg'),
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
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                    usernameField(_usernameController),
                    SignInPassField(_passwordController)
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 40),
              /*child: Builder(builder: (BuildContext context) {
                return buildButton('Continue', Icons.email, () {
                  if (_signInKey.currentState.validate()) {
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
                });
              }),*/
              child: Builder(builder: (BuildContext context) {
                return buildButton(
                  'Continue',
                  Icons.email,
                  () async {
                    bool shouldNavigate = await signIn(
                        _usernameController.text, _passwordController.text);
                    print(shouldNavigate);
                    if (shouldNavigate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                );
              }),
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
