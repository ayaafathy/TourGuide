import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_guide/screens/settings_UI.dart';
import 'package:tour_guide/screens/signin_UI.dart';
import 'package:tour_guide/main.dart';

class DashNav extends StatefulWidget {
  @override
  _DashNavState createState() => _DashNavState();
}

class _DashNavState extends State<DashNav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Marc Ashraf',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            accountEmail: Text(
              'marc_ashraf@gmail.com',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/citylights.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/marc.jpg')),
          ),
          Container(
            child: buildList(),
          ),
        ],
      ),
    );
  }

  Column buildList() {
    return Column(
      children: [
        ListTile(
            leading: Icon(Icons.explore),
            tileColor: Colors.indigo[100],
            title: Text("LET'S DO SOMETHING!"),
            onTap: () {}),
        Divider(),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Feed'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
        ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.recommend),
            title: Text('Recommendations'),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.favorite), title: Text('Saved'), onTap: () {}),
        ListTile(
            leading: Icon(Icons.where_to_vote),
            title: Text('Visited places'),
            onTap: () {}),
        Divider(),
        ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            }),
        ListTile(
          leading: Icon(Icons.power_settings_new),
          title: Text("Logout"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
        ),
      ],
    );
  }
}
