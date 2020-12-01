import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/appBar.dart';
import 'package:tour_guide/screens/faq_UI.dart';

void main() => runApp(HelpCenter());

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          appBar: buildAppBar(null, () {}, 'Help'),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: FAQ(),
            ),
          ),
        ),
      ),
    );
  }
}
