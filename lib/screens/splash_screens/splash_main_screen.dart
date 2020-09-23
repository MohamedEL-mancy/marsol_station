import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'splash_market_now.dart';
import 'package:marsol/constants/colors_app.dart';

class SplashMainScreen extends StatefulWidget {
  static String id = "SplashMainScreen";
  @override
  _SplashMainScreenState createState() => _SplashMainScreenState();
}

class _SplashMainScreenState extends State<SplashMainScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SplashMarketNow(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 51, 39, 64),
          elevation: 0,
          leading: ShaderMask(
            shaderCallback: (rec) =>
                LinearGradient(colors: colors).createShader(rec),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/splash_screen/splash1.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: height,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: DotsIndicator(
                          decorator: DotsDecorator(
                            activeColor: Colors.blue,
                            activeSize: Size(15.0, 50.0),
                          ),
                          dotsCount: 4,
                          reversed: true,
                          position: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
