import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:marsol/constants/custom_texts.dart';

import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/widgets.dart';

class SplashScreens extends StatefulWidget {
  final String title, desc, image, btName;
  final double position;
  final Function onPress;
  SplashScreens(
      {this.title,
      this.desc,
      this.image,
      this.btName,
      this.position,
      this.onPress});

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation _animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
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
            Container(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: WaveClipperTwo(reverse: true, flip: true),
                child: Container(
                  height: height * 0.8,
                  width: double.infinity,
                  color: Color.fromARGB(255, 44, 34, 55),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    height: height * 0.4,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: customText(
                    title: widget.title,
                    font: 30.0,
                  ),
                ),
                Container(
                  height: _animation.value * height * 0.13,
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    widget.desc,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DotsIndicator(
                  dotsCount: 4,
                  position: widget.position,
                  reversed: true,
                  decorator: DotsDecorator(
                    activeColor: Colors.blue,
                    activeSize: Size(15.0, 50.0),
                  ),
                ),
                GestureDetector(
                  onTap: widget.onPress,
                  child:
                      buttons(title: widget.btName, height: 40.0, width: 120.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
