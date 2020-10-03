import 'package:flutter/material.dart';

class MapData extends ChangeNotifier {
  String placeName;
  double latAddress, longAddres;
  void getPlaceName(String name) {
    placeName = name;
    notifyListeners();
  }

  void getLatAddress(double lat) {
    latAddress = lat;
    notifyListeners();
  }

  void getLongAddress(double long) {
    longAddres = long;
    notifyListeners();
  }
}
