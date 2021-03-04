import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  String _messageTitle = '';
  String _messageBody = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    _firebaseMessaging
        .getToken()
        .then((token) => print("My token__________________________ $token"));
  }

  void getMessage() {
    _firebaseMessaging.configure(onMessage: (message) async {
      print('onMessage_____________________Foreground');
      setState(() {
        _messageTitle = message['notification']['title'];
        _messageBody = message['notification']['body'];
      });
    }, onResume: (message) async {
      print('onMessage_____________________Background');
      setState(() {
        _messageTitle = message['notification']['title'];
        _messageBody = message['notification']['body'];
      });
    }, onLaunch: (message) async {
      print('onMessage_____________________app locked');
      setState(() {
        _messageTitle = message['notification']['title'];
        _messageBody = message['notification']['body'];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Message Title: $_messageTitle '),
            OutlineButton(
              child: Text("Register My device"),
              onPressed: () {
                _register();
              },
            ),
            Text("Message Body $_messageBody"),
          ],
        ),
      ),
    );
  }
}
