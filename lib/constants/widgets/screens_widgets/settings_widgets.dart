import 'package:flutter/material.dart';
import 'package:marsol/constants/custom_texts.dart';

Widget infoProfileSettings({String title, String info}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: describtionTextStyle,
        ),
        Text(
          info,
          style: describtionTextStyle,
        ),
      ],
    ),
  );
}

Widget infoAppSetting({String title, String info}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(Icons.alarm, color: Colors.white),
          SizedBox(width: 5.0),
          Text(
            title,
            style: headLineTextStyle,
          ),
        ],
      ),
      Text(
        info,
        style: describtionTextStyle,
      )
    ],
  );
}

List<Color> settingsColors = [
  Color.fromARGB(255, 54, 29, 83),
  Color.fromARGB(255, 52, 27, 80),
  Color.fromARGB(255, 40, 44, 76),
  Color.fromARGB(255, 38, 42, 74),
  Color.fromARGB(255, 36, 40, 72),
];

Widget containerProfileSetting({double height}) {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: settingsColors,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: Colors.white,
                ),
                SizedBox(width: 5.0),
                Text(
                  "الإعدادات الشخصية",
                  style: headLineTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "تعديل",
                style: describtionTextStyle,
              ),
            )
          ],
        ),
        infoProfileSettings(title: "الأسم بالكامل", info: "مرسول ستيشن"),
        infoProfileSettings(title: "الإيميل", info: "marsol@gmail.com"),
        infoProfileSettings(title: "الهاتف", info: "00 000 000 0100"),
        infoProfileSettings(title: "العنوان", info: ""),
        infoProfileSettings(title: "معلومات عنا", info: ""),
      ],
    ),
  );
}

Widget containerAppSetting({double height}) {
  return Container(
    padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: settingsColors,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: Colors.white,
                ),
                SizedBox(width: 5.0),
                Text(
                  "تعديلات البرنامج",
                  style: headLineTextStyle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ],
        ),
        infoAppSetting(title: "اللغة", info: "العربية"),
        infoAppSetting(title: "عنوان التوصيل", info: ""),
        infoAppSetting(title: "المساعدة والدعم", info: "")
      ],
    ),
  );
}
