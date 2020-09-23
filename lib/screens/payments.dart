import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets/screens_widgets/payment_widgets.dart';

class Payments extends StatefulWidget {
  static String id = "Payments";
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  TextStyle activeStyle = TextStyle(color: Colors.white, fontSize: 13.0);
  TextStyle inActiveStyle = TextStyle(color: Colors.black, fontSize: 13.0);
  bool active = true;
  bool inActive = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 45, 35, 57),
        appBar: AppBar(
          leading: Container(),
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 20, 16, 25),
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Row(
              children: [
                ShaderMask(
                  shaderCallback: (rec) => LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: colors)
                      .createShader(rec),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  "assets/icons/card.png",
                  height: 30.0,
                )
              ],
            ),
          ),
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.only(left: 40.0, bottom: 20.0),
            child: ShaderMask(
              shaderCallback: (rec) => LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: textColors,
              ).createShader(rec),
              child: Text(
                "طريقة الدفع",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                payment(
                  onPress: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  title: "بطاقة فيزا",
                  image: "assets/icons/visa.png",
                  widget: Text("تنتهي ب 2341",
                      style: index == 0 ? activeStyle : inActiveStyle),
                  imageColor: index == 0 ? Colors.white : Colors.green,
                  isActive: index == 0 ? active : inActive,
                ),
                payment(
                  onPress: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  title: "بطاقة ماستر كارد",
                  image: "assets/icons/master_card.png",
                  widget: Text("تنتهي ب 4242", style: activeStyle),
                  isActive: index == 1 ? active : inActive,
                ),
                payment(
                  onPress: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  title: "بطاقة أمريكان أكسبريس",
                  image: "assets/icons/express.png",
                  widget: Text(
                    "تنتهي ب 7073",
                    style: activeStyle,
                  ),
                  isActive: index == 2 ? active : inActive,
                ),
                payment(
                  onPress: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  title: "بطاقة مدي",
                  image: "assets/icons/mada_card.png",
                  widget: Text("تنتهي ب 8003", style: activeStyle),
                  isActive: index == 3 ? active : inActive,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.transparent,
                          style: BorderStyle.solid,
                          width: 1.5),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 0, 172, 210),
                          Color.fromARGB(255, 133, 2, 228),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      )),
                  child: Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 43, 33, 54),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (rec) =>
                              LinearGradient(colors: colors).createShader(rec),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "إضافة بطاقات جديدة",
                          style: normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                payment(
                    onPress: () {
                      setState(() {
                        index = 4;
                      });
                    },
                    title: "الدفع عند الإستلام",
                    image: "assets/icons/pay_receive.png",
                    widget: Container(),
                    isActive: index == 4 ? active : inActive,
                    imageColor: index == 4 ? Colors.white : null),
                payment(
                  onPress: () {
                    setState(() {
                      index = 5;
                    });
                  },
                  title: "قسيمة الشحن",
                  image: "assets/icons/shipping.png",
                  widget: Container(),
                  isActive: index == 5 ? active : inActive,
                  imageColor: index == 5 ? Colors.white : null,
                ),
                payment(
                  onPress: () {
                    setState(() {
                      index = 6;
                    });
                  },
                  title: "المحفظة",
                  image: "assets/icons/wallet.png",
                  widget: Text("الرصيد 00.00",
                      style: index == 6 ? activeStyle : inActiveStyle),
                  isActive: index == 6 ? active : inActive,
                  imageColor: index == 6 ? Colors.white : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
