import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';

Widget addPlusCircle() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight, colors: colors),
      borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      ),
    ),
    child: Icon(
      Icons.add,
      color: Colors.white,
    ),
  );
}

Widget circlesAddMinus({IconData icon}) {
  return Container(
    padding: EdgeInsets.all(3.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    child: Icon(
      icon,
      color: Colors.black,
      size: 13.0,
    ),
  );
}
