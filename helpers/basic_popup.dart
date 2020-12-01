import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyLayout()),
    );
  }
}

class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text('Show alert'),
        onPressed: () {
          recommendationPopUp(context);
        },
      ),
    );
  }
}

recommendationPopUp(BuildContext context) {
  Widget viewButton = FlatButton(
    child: Text('View'),
    onPressed: () {},
  );
  Widget saveButton = FlatButton(
    child: Text('Later'),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text(''),
    content: Text('Your daily recommendation is here!'),
    actions: [
      viewButton,
      saveButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
