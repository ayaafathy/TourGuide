import 'package:flutter/material.dart';

Widget buildAppBar(IconData icon, onPress, String title) {
  return AppBar(
    elevation: 5,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(
        icon,
        color: Colors.lightBlue[300],
        size: 35,
      ),
      tooltip: 'Drawer',
      onPressed: onPress,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.lightBlue[300],
        fontSize: 20,
      ),
    ),
    centerTitle: true,
  );
}
