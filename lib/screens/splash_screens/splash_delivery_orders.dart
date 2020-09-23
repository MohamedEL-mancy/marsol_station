import 'package:flutter/material.dart';
import 'package:marsol/constants/navigation_animation.dart';
import 'package:marsol/screens/login.dart';

import 'splash_screens.dart';

class SplashDeliveryOrders extends StatelessWidget {
  static String id = "SplashDeliveryOrders";
  @override
  Widget build(BuildContext context) {
    return SplashScreens(
      title: "توصيل الطلبات",
      desc:
          "احتياجاتك متوفرة لدينا - حمل التطبيق, واختر طعامك أو منتجات البقالة, وادفع خلال ثوان قليلة ببطاقة الفيزا أو نقدا عند التوصيل  ",
      image: "assets/splash_screen/delivery_orders.png",
      btName: "أبدأ",
      position: 3,
      onPress: () {
        Navigator.pushReplacement(
          context,
          NavigationPages(
            page: Login(),
          ),
        );
      },
    );
  }
}
