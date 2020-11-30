import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_guide/widgets/fonts_style.dart';
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
    ///ICON COLOR: GREY
    Color iconColor = Colors.grey[700];
    return Column(
      children: [
        ListTile(
            leading: Icon(Icons.explore, color: iconColor),
            tileColor: Color.fromRGBO(102, 165, 255, 0.2),
            title: Text("LET'S DO SOMETHING!", style: tilesStyle()),
            onTap: () {}),
        Divider(),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Feed', style: tilesStyle()),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
        ListTile(
            leading: Icon(Icons.notifications, color: iconColor),
            title: Text('Notifications', style: tilesStyle()),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.recommend, color: iconColor),
            title: Text('Recommendations', style: tilesStyle()),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.favorite, color: iconColor),
            title: Text('Saved', style: tilesStyle()),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.where_to_vote, color: iconColor),
            title: Text('Visited places', style: tilesStyle()),
            onTap: () {}),
        Divider(),
        ListTile(
            leading: Icon(Icons.settings, color: iconColor),
            title: Text('Settings', style: tilesStyle()),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            }),
        ListTile(
          leading: Icon(Icons.power_settings_new, color: iconColor),
          title: Text('Logout', style: tilesStyle()),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
        ),
      ],
    );
  }
}
