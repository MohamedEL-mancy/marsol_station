import 'package:flutter/material.dart';
import 'splash_delivery_orders.dart';
import 'splash_screens.dart';

class Splashreceive extends StatelessWidget {
  static String id = "Splashreceive";
  @override
  Widget build(BuildContext context) {
    return SplashScreens(
      title: "عملية الأستلام",
      desc:
          "حمل التطبيق,واختر جميع احتاجاتك وستوصلك في الحال وباسرع وقت ممكن في اي مكان داخل السعودية.",
      image: "assets/splash_screen/receiver.png",
      btName: "التالي",
      position: 2,
      onPress: () {
        Navigator.pushReplacementNamed(context, SplashDeliveryOrders.id);
      },
    );
  }
}
