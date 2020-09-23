import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:marsol/constants/widgets/screens_widgets/details_screen_widgets.dart';
import 'package:provider/provider.dart';

Widget floatingButtonStyle(BuildContext context) {
  var data = Provider.of<DetailsWidgets>(context);
  return Container(
    padding: EdgeInsets.all(5.0),
    height: 40.0,
    width: 40.0,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: data.detailsBoxColors),
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    child: Badge(
      child: Image.asset(
        "assets/icons/shopping.png",
        color: Colors.white,
      ),
      badgeContent: Text("1"),
      badgeColor: Colors.white,
    ),
  );
}
