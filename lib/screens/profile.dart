import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/screens/payments.dart';
import 'package:marsol/screens/settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 39, 64),
      appBar: AppBar(
        actions: [
          ShaderMask(
            shaderCallback: (rec) => LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 61, 72, 190),
                Color.fromARGB(255, 27, 104, 172),
                Color.fromARGB(255, 119, 15, 220),
              ],
            ).createShader(rec),
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 34, 26, 43),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.15,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 35, 30, 40),
                      Color.fromARGB(255, 23, 18, 29),
                    ],
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.lightBlue,
                              child: Icon(
                                Icons.person,
                                size: 40.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("UserName", style: normalTextStyle),
                                Row(
                                  children: [
                                    ratesUserStars(),
                                    ratesUserStars(),
                                    ratesUserStars(),
                                    ratesUserStars(),
                                    ratesUserStars(),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      ShaderMask(
                        shaderCallback: (rect) =>
                            LinearGradient(colors: colors).createShader(rect),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.bell),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 30.0,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (rect) =>
                            LinearGradient(colors: colors).createShader(rect),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.powerOff),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              marketProfile(
                  title: "رصيد الحساب",
                  detailsTitle: "0.0 ريال سعودي",
                  imageIcon: "assets/icons/profile/rased.png"),
              marketProfile(
                  title: "عدد الطلبات",
                  detailsTitle: "0 طلبات",
                  imageIcon: "assets/icons/profile/number_orders.png"),
              marketProfile(
                  title: "تقييمات الخدمات",
                  detailsTitle: "0",
                  imageIcon: "assets/icons/profile/rates.png"),
              marketProfile(
                  title: "ملاحظات المستخدمين",
                  detailsTitle: "0",
                  imageIcon: "assets/icons/profile/notes.png"),
              marketProfile(
                  title: "الكوبونات",
                  imageIcon: "assets/icons/profile/cobonat.png"),
              marketProfile(
                  title: "إعدادات",
                  detailsTitle: "",
                  imageIcon: "assets/icons/profile/settings.png",
                  function: () {
                    Navigator.pushNamed(context, Settings.id);
                  }),
              marketProfile(
                  title: "طريقة السداد",
                  detailsTitle: "",
                  imageIcon: "assets/icons/profile/cobonat.png",
                  function: () {
                    Navigator.pushNamed(context, Payments.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
