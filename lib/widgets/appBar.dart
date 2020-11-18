import 'package:flutter/material.dart';

Widget buildAppBar(onPress, String title) {
  return AppBar(
    elevation: 5,
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
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
        fontSize: 22,
      ),
    ),
    centerTitle: true,
  );
}
