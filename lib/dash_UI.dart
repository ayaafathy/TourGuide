import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashNav extends StatefulWidget {
  @override
  _DashNavState createState() => _DashNavState();
}

class _DashNavState extends State<DashNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text("")
          ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                'Anne Adams',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              accountEmail: new Text(
                'anne_adams@gmail.com',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('images/citylights.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: AssetImage('images/dog.jpg')),
            ),
            Container(
              child: buildList(),
            )
          ],
        ),
      ),
    );
  }

  Column buildList() {
    return Column(
      children: [
        new ListTile(
            leading: Icon(Icons.explore),
            tileColor: Colors.indigo[100],
            title: new Text("LET'S DO SOMETHING!"),
            onTap: () {}),
        new Divider(),
        new ListTile(
            leading: Icon(Icons.notifications),
            title: new Text('Feed'),
            onTap: () {}),
        new ListTile(
            leading: Icon(Icons.favorite),
            title: new Text('Saved'),
            onTap: () {}),
        new ListTile(
            leading: Icon(Icons.message),
            title: new Text('Messages'),
            onTap: () {}),
        new ListTile(
            leading: Icon(Icons.recommend),
            title: new Text('Recommendations'),
            onTap: () {}),
        new ListTile(
            leading: Icon(Icons.public),
            title: new Text('Tours'),
            onTap: () {}),
        new Divider(),
        new ListTile(
            leading: Icon(Icons.settings),
            title: new Text("Settings"),
            onTap: () {}),
        new ListTile(
            leading: Icon(Icons.power_settings_new),
            title: new Text("Logout"),
            onTap: () {}),
      ],
    );
  }
}
