import 'package:flutter/material.dart';

class ListsProvider extends ChangeNotifier {
  List<String> types = [
    "الكل",
    "فاشون",
    "تجميل",
    "صيدليات",
    "كافيهات",
    "مطاعم"
  ];

  List<String> allGridView = ["فاشون", "تجميل", "صيدليات", "كافيهات", "مطاعم"];
  List<String> pharmacys = [
    "صيدلية 1",
    "صيدلية 2",
    "صيدلية 3",
    "صيدلية 4",
    "صيدلية 5",
    "صيدلية 6"
  ];
  List<String> fashions = [
    "فاشون 1",
    "فاشون 2",
    "فاشون 3",
    "فاشون 4",
    "فاشون 5",
    "فاشون 6"
  ];

  List<String> tagmel = [
    "تجميل 1",
    "تجميل 2",
    "تجميل 3",
    "تجميل 4",
    "تجميل 5",
    "تجميل 6"
  ];

  List<String> cafes = [
    "كوفي 1",
    "كوفي 2",
    "كوفي 3",
    "كوفي 4",
    "كوفي 5",
    "كوفي 6"
  ];

  List<String> restaurants = [
    "مطعم 1",
    "مطعم 2",
    "مطعم 3",
    "مطعم 4",
    "مطعم 5",
    "مطعم 6"
  ];
  List<Color> activeColors = [
    Color.fromARGB(255, 15, 117, 165),
    Color.fromARGB(255, 15, 117, 165),
    Color.fromARGB(255, 52, 80, 186),
    Color.fromARGB(255, 52, 80, 186),
    Color.fromARGB(255, 121, 13, 221),
    Color.fromARGB(255, 121, 13, 221)
  ];
  List<Color> inActive = [Colors.white, Colors.white];
}
