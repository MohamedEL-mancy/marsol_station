import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets/screens_widgets/addtocart_widgets.dart';
import 'package:marsol/screens/wasf.dart';

class CheckOut extends StatefulWidget {
  static String id = "CheckOut";
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  double number = 1.0;
  void plus() {
    setState(() {
      number++;
    });
  }

  void minus() {
    if (number <= 0) {
      setState(() {
        number = 0;
      });
    } else {
      setState(() {
        number--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 42, 32, 52),
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: height * 0.06,
          leading: ShaderMask(
            shaderCallback: (rec) =>
                LinearGradient(colors: colors).createShader(rec),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: height * 0.18,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                  ),
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "عربة الشحن",
                            style: headLineTextStyle,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 35.0),
                        child: Text(
                          "تحقق من الكمية الخاصة بك وانقر فوق الخروج",
                          style: describtionTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/icons/camera.png"),
                            radius: 30.0,
                          ),
                          SizedBox(width: 5.0),
                          Column(
                            children: [
                              Text(
                                "المنتج",
                                style: headLineTextStyle,
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "\$ 8.00",
                                style: headLineTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                minus();
                              },
                              child: circlesAddMinus(
                                  icon: FontAwesomeIcons.minus)),
                          SizedBox(width: 5.0),
                          Text(
                            "${number.toString()}",
                            style: normalTextStyle,
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              plus();
                            },
                            child: circlesAddMinus(icon: FontAwesomeIcons.plus),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(color: Colors.purple),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: colors),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    padding: EdgeInsets.only(left: 20.0, top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "هل لديك رمز كوبون؟",
                        contentPadding:
                            EdgeInsets.only(right: 20.0, bottom: 10.0),
                        hintStyle: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Wasf.id);
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("المجموع الكلي", style: normalTextStyle),
                            Text(
                              "\$ 8.00",
                              style: normalTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("توصيل مجاني", style: normalTextStyle),
                            Text(
                              "--",
                              style: normalTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الضرائب (7.08٪)", style: normalTextStyle),
                            Text(
                              "\$ 5.10",
                              style: normalTextStyle,
                            )
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "الدفع",
                                style: blackTexts,
                              ),
                              Text(
                                "\$ 13.10",
                                style: blackTexts,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
