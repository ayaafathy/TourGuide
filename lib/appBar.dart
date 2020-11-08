import 'package:flutter/material.dart';

Widget buildAppBar(onPress, String title) {
  return AppBar(
    elevation: 5,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.indigo[400],
        size: 35,
      ),
      tooltip: 'Drawer',
      onPressed: onPress,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.indigo[300],
      ),
    ),
    centerTitle: true,
  );
}
