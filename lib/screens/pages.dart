import 'package:flutter/material.dart';

import 'package:marsol/screens/home.dart';

import 'package:marsol/screens/notifications.dart';
import 'package:marsol/screens/orders.dart';

import 'package:marsol/screens/profile.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'boot_messages.dart';

class Pages extends StatefulWidget {
  static String id = "Pages";
  @override
  _PagesState createState() {
    return _PagesState();
  }
}

class _PagesState extends State<Pages> {
  bool isActiveHome = false;
  bool isActiveTruc = false;
  bool isActiveNotif = false;
  bool isActiveSignIn = false;
  List<Color> activeColorsHome = [
    Color.fromARGB(255, 4, 127, 160),
    Color.fromARGB(255, 55, 77, 187),
    Color.fromARGB(255, 95, 39, 208),
  ];
  List<Color> inActiveColorsHome = [Colors.grey, Colors.grey];

  int currentIndex = 4;
  List<Widget> children = [
    Profile(),
    Notifications(),
    Messages(),
    Orders(),
    HomePage(),
  ];
  void onTapped(int i) {
    print(i);
    setState(() {
      currentIndex = i;
    });

    if (i == 0) {
      setState(() {
        isActiveSignIn = true;
        isActiveHome = false;
        isActiveNotif = false;
        isActiveTruc = false;
      });
    } else if (i == 1) {
      setState(() {
        isActiveNotif = true;
        isActiveTruc = false;
        isActiveHome = false;
        isActiveSignIn = false;
      });
    } else if (i == 2) {
      setState(() {
        isActiveHome = false;
        isActiveNotif = false;
        isActiveNotif = false;
        isActiveSignIn = false;
      });
    } else if (i == 3) {
      setState(() {
        isActiveTruc = true;
        isActiveNotif = false;
        isActiveHome = false;
        isActiveSignIn = false;
      });
    } else if (i == 4) {
      setState(() {
        isActiveHome = true;
        isActiveSignIn = false;
        isActiveTruc = false;
        isActiveNotif = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.grey.shade300,
        child: BottomNavStyle15(
          navBarHeight: 70.0,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          selectedIndex: currentIndex,
          popScreensOnTapOfSelectedTab: true,
          onItemSelected: onTapped,
          items: [
            PersistentBottomNavBarItem(
              icon: ShaderMask(
                shaderCallback: (rec) => LinearGradient(
                        colors: isActiveSignIn
                            ? activeColorsHome
                            : inActiveColorsHome)
                    .createShader(rec),
                child: Image.asset(
                  "assets/icons/sign_in.png",
                  color: Colors.grey,
                ),
              ),
            ),
            PersistentBottomNavBarItem(
              icon: ShaderMask(
                shaderCallback: (rec) => LinearGradient(
                        colors: isActiveNotif
                            ? activeColorsHome
                            : inActiveColorsHome)
                    .createShader(rec),
                child: Image.asset(
                  "assets/icons/notifictions.png",
                  color: Colors.grey,
                ),
              ),
            ),
            PersistentBottomNavBarItem(
              activeColor: Colors.transparent,
              icon: Container(
                child: Image.asset(
                  "assets/icons/main_icon.png",
                ),
              ),
            ),
            PersistentBottomNavBarItem(
              icon: ShaderMask(
                shaderCallback: (rec) => LinearGradient(
                  colors: isActiveTruc ? activeColorsHome : inActiveColorsHome,
                ).createShader(rec),
                child: Image.asset(
                  "assets/icons/truck.png",
                  color: Colors.grey,
                ),
              ),
            ),
            PersistentBottomNavBarItem(
              icon: ShaderMask(
                shaderCallback: (rec) => LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: isActiveHome
                            ? activeColorsHome
                            : inActiveColorsHome)
                    .createShader(rec),
                child: Image.asset(
                  "assets/icons/home.png",
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
