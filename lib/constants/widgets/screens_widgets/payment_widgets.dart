import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';

Widget payment({
  String title,
  String image,
  Widget widget,
  Color imageColor,
  bool isActive,
  Function onPress,
}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: isActive ? colors : [Colors.white, Colors.white]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  image,
                  height: 30.0,
                  color: imageColor,
                ),
              ),
              VerticalDivider(
                color: Colors.white,
                endIndent: 5.0,
                indent: 10.0,
              ),
              Text(
                title,
                style: isActive
                    ? normalTextStyle
                    : TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            child: widget,
          )
        ],
      ),
    ),
  );
}
