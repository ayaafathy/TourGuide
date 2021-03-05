import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/appBar.dart';
import 'package:tour_guide/screens/faq_UI.dart';

void main() => runApp(HelpCenter());

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Removed excess MaterialApp

    return Scaffold(
      appBar: buildAppBar(Icons.arrow_back_rounded, () {
        Navigator.pop(context);
      }, 'Help'),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: FAQ(),
        ),
      ),
    );
  }
}
