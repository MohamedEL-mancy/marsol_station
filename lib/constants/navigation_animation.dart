import 'package:flutter/material.dart';

class NavigationPages extends PageRouteBuilder {
  final Widget page;
  NavigationPages({this.page})
      : super(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: (context, animations, animation) => page,
          transitionsBuilder: (context, animations, animation, child) {
            var begin = 1.0;
            var end = 2.0;
            var tween = Tween(begin: begin, end: end);

            var curvesAnimation = CurvedAnimation(
                parent: animations, curve: Curves.linearToEaseOut);
            return RotationTransition(
              turns: tween.animate(curvesAnimation),
              child: child,
            );
          },
        );
}
