import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/constants/widgets/screens_widgets/wasf_widgets.dart';
import 'package:marsol/screens/delivery_place.dart';
import 'package:marsol/constants/colors_app.dart';

class Wasf extends StatefulWidget {
  static String id = "Wasf";
  @override
  _WasfState createState() => _WasfState();
}

class _WasfState extends State<Wasf> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 38, 29, 47),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 21, 16, 26),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                "UserName",
                style: headLineTextStyle,
              ),
              Text(
                "الوصف",
                style: describtionTextStyle,
              )
            ],
          ),
          actions: [
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/icons/camera.png",
                  width: 30.0,
                ),
              ),
            ),
            ShaderMask(
              shaderCallback: (rec) =>
                  LinearGradient(colors: colors).createShader(rec),
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 35.0,
              ),
            )
          ],
          leading: ShaderMask(
            shaderCallback: (rec) =>
                LinearGradient(colors: colors).createShader(rec),
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
              iconSize: 35.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "الوصف",
                                style: describtionTextStyle,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.purple,
                                size: 35.0,
                              ),
                            ],
                          ),
                          Text(
                            "الوصف بالكامل للمنتج",
                            style: describtionTextStyle,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 70.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dividerLine(
                                    colour: Colors.purple, width: width * 0.4),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "تقييمات المستخدمين",
                                      style: describtionTextStyle,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.purple,
                                      size: 20.0,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    rateWasf(),
                                    rateWasf(),
                                    rateWasf(),
                                    rateWasf(),
                                    rateWasf(),
                                    Text(
                                      "4.4",
                                      style: describtionTextStyle,
                                    )
                                  ],
                                ),
                                dividerLine(
                                  colour: Color.fromARGB(255, 1, 130, 158),
                                  width: width * 0.4,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 1, 129, 158),
                              Color.fromARGB(255, 133, 0, 229),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          border:
                              Border.all(width: 3.0, color: Colors.transparent),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(40.0),
                          height: height * 0.3,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            "assets/icons/camera.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  wasfInfo(
                    title: "العنوان",
                    subTitle: "يبعد عن 4.64 كم",
                    option: "تغيير",
                    leadingIcon: Icons.location_on,
                    tralingIcon: Icons.arrow_forward_ios,
                  ),
                  Divider(color: Colors.purple),
                  wasfInfo(
                    title: "مفتوح",
                    subTitle: "من 00.00 إلي 00.00",
                    tralingIcon: Icons.arrow_forward_ios,
                    leadingIcon: FontAwesomeIcons.clock,
                    option: "عرض الأوقات",
                  ),
                  Divider(color: Colors.purple),
                  Row(
                    children: [
                      Text(
                        "القائمة",
                        style: describtionTextStyle,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.purple,
                      )
                    ],
                  ),
                  Container(
                    height: height * 0.15,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Image.asset("assets/icons/camera.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DeliveryPlace.id);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: buttons(
                        title: "أطلب الآن",
                        font: 16.0,
                        height: height * 0.06,
                        width: double.infinity,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
