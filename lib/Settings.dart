import 'dart:developer';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* This widget is the root
      of your application.*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child:  Text('Settings', style: TextStyle(
            color: Colors.black,
          ), textAlign: TextAlign.center, ) ,


    ),


    ),
        backgroundColor: Colors.white,
        body: SafeArea(

          child: Column(
            children: <Widget>[
              //Name
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BuildButtonColumn(Colors.blue, Icons.edit, 'ME'),
              Container(
                height: 150,
                width: 172,
                margin: EdgeInsets.all(3.0),
                child: Card(
                  color: Colors.indigo[100],

                  child: Padding(
                      padding: EdgeInsets.all(10.0),

                  ),
                ),
              ),
              //Notifications

              Container(
                height: 100,
                width: 160,
                margin: EdgeInsets.all(6.0),
                child: Card(
                  color: Colors.white,
                  shape: Border.all(
                    color: Colors.blue,
                    width: 1.0,),
                  child: Padding(
                    padding: EdgeInsets.all(1.0),

                  ),
                ),

              ),
              ]),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BuildButtonColumn(Colors.blue, Icons.notifications_active, 'Notification'),

            Container(
                height: 150,
                width: 172,
                margin: EdgeInsets.all(3.0),
                child: Card(
                  color: Colors.indigo[100],
                  child: Padding(
                    padding: EdgeInsets.all(3.0),

                  ),
                ),
              ),
            BuildButtonColumn(Colors.blue, Icons.settings, 'Settings'),

            Container(
                height: 150,
                width: 172,
                margin: EdgeInsets.all(1.0),
                child: Card(
                  color: Colors.indigo[100],
                  child: Padding(
                    padding: EdgeInsets.all(1.0),

                  ),
                ),
              ),
          ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BuildButtonColumn(Colors.blue, Icons.person, 'Linked Accounts'),

                Container(
                  height: 150,
                  width: 172,
                  margin: EdgeInsets.all(3.0),
                  child: Card(
                    color: Colors.indigo[100],
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                  ),
                ),
                BuildButtonColumn(Colors.blue, Icons.lock, 'Privacy'),

                Container(
                  height: 150,
                  width: 172,
                  margin: EdgeInsets.all(1.0),
                  child: Card(
                    color: Colors.indigo[100],
                    child: Padding(
                      padding: EdgeInsets.all(1.0),

                    ),
                  ),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BuildButtonColumn(Colors.blue, Icons.block, 'Block'),

                Container(
                  height: 150,
                  width: 172,
                  margin: EdgeInsets.all(3.0),
                  child: Card(
                    color: Colors.indigo[100],
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                  ),
                ),
                BuildButtonColumn(Colors.blue, Icons.help, 'Help'),

                Container(
                  height: 150,
                  width: 172,
                  margin: EdgeInsets.all(1.0),
                  child: Card(
                    color: Colors.indigo[100],
                    child: Padding(
                      padding: EdgeInsets.all(1.0),

                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),

      ),
    );
  }
}

Column BuildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

