import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/appBar.dart';
import 'package:tour_guide/widgets/fonts_style.dart';
import 'package:tour_guide/screens/faq_UI.dart';

void main() => runApp(SettingsScreen());

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          appBar: buildAppBar(null, () {}, 'Settings'),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(20),
              child: settings(context),
            ),
          ),
        ),
      ),
    );
  }
}

Widget settings(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    padding: EdgeInsets.all(4.0),
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 5.0 / 4.0,
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(102, 165, 255, 0.2),
          borderRadius: BorderRadius.all(Radius.circular(11)),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              ListTile(
                leading: avatar(),
              ),
              ListTile(
                leading: Text(
                  'Edit Profile',
                  textAlign: TextAlign.left,
                  style: tilesStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
      settingTile(() {}, Icons.lock, 'Privacy'),
      settingTile(() {}, Icons.palette, 'Appearance'),
      settingTile(() {}, Icons.notifications, 'Notifications'),
      settingTile(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HelpCenter()));
      }, Icons.help_rounded, 'Help Center'),
    ],
  );
}

Widget settingTile(onTap, IconData icon, String title) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color.fromRGBO(102, 165, 255, 0.2),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              icon,
              size: 30,
              color: Colors.grey[700],
            ),
          ),
          ListTile(
            leading: Text(
              title,
              textAlign: TextAlign.left,
              style: tilesStyle(),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget avatar() {
  return Container(
    width: 48,
    height: 48,
    padding: EdgeInsets.all(4.0),
    alignment: Alignment.topLeft,
    child: CircleAvatar(
      radius: 35,
      backgroundImage: AssetImage('assets/images/marc.jpg'),
    ),
  );
}
