import 'package:flutter/material.dart';

Widget customText({String title, double font}) {
  return ShaderMask(
    shaderCallback: (rec) => LinearGradient(colors: [
      Color.fromARGB(255, 97, 36, 209),
      Color.fromARGB(255, 1, 130, 158),
    ]).createShader(rec),
    child: Text(
      title,
      style: TextStyle(
          color: Colors.white, fontSize: font, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}

TextStyle normalTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

TextStyle headLineTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

TextStyle describtionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

final TextStyle blackTexts = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
