import 'package:flutter/material.dart';
import 'package:marsol/screens/splash_screens/splash_recieve.dart';

import 'splash_screens.dart';

class SplashMarketNow extends StatelessWidget {
  static String id = "SplashMarketNow";
  @override
  Widget build(BuildContext context) {
    return SplashScreens(
      title: "تسوق الأن",
      desc:
          "اعثر علي أرخص الأسعار.افضل تنزيلات علي التسوق في السعودية.خصومات خاصة..أشهر الماركات.آخر السلع الجديدة.:أشهر المتاجر,,عروض الأعياد,أعثر علي أفضل الأسعار.",
      image: "assets/splash_screen/market_now.png",
      btName: "التالي",
      position: 1,
      onPress: () {
        Navigator.pushReplacementNamed(context, Splashreceive.id);
      },
    );
  }
}
