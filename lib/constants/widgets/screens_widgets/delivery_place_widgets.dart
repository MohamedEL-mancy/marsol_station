import 'package:flutter/material.dart';
import 'package:marsol/constants/custom_texts.dart';

import '../../colors_app.dart';

Widget deliveryInfo(
    {double height,
    String title,
    String subTitle,
    IconData icon,
    double width,
    bool isActive}) {
  return Container(
    padding: EdgeInsets.only(top: 10.0, right: 10.0),
    margin: EdgeInsets.only(left: 10.0, right: 10.0),
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      gradient: LinearGradient(
        colors: isActive ? colors : [Colors.white, Colors.white],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.black,
            ),
            VerticalDivider(
              color: isActive ? Colors.white : Colors.purple,
              indent: 1,
              endIndent: 10,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: isActive ? describtionTextStyle : blackTexts,
                  ),
                  Container(
                    width: width,
                    child: Text(
                      subTitle,
                      style: isActive ? describtionTextStyle : blackTexts,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Icon(
          Icons.arrow_drop_down,
          color: isActive ? Colors.white : Colors.purple,
          size: 30.0,
        ),
      ],
    ),
  );
}
