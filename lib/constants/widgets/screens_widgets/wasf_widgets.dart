import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';

Widget rateWasf() {
  return Icon(
    Icons.star,
    color: Colors.yellow,
    size: 15.0,
  );
}

Widget dividerLine({double width, Color colour}) {
  return Container(
    height: 1,
    color: colour,
    width: width,
  );
}

Widget wasfInfo({
  String title,
  String subTitle,
  IconData tralingIcon,
  String option,
  IconData leadingIcon,
}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (rec) => LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: colors)
                      .createShader(rec),
                  child: Icon(
                    leadingIcon,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  title,
                  style: describtionTextStyle,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Text(
                subTitle,
                style: describtionTextStyle,
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              option,
              style: describtionTextStyle,
            ),
            ShaderMask(
              shaderCallback: (rec) =>
                  LinearGradient(colors: colors).createShader(rec),
              child: Icon(
                tralingIcon,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    ),
  );
}
