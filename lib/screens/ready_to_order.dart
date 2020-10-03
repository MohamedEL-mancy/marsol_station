import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/models/db_helper.dart';
import 'package:marsol/models/orders_class.dart';
import 'package:marsol/screens/orders.dart';

class ReadyToOrder extends StatefulWidget {
  @override
  _ReadyToOrderState createState() => _ReadyToOrderState();
}

class _ReadyToOrderState extends State<ReadyToOrder> {
  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  String title = "طباتي الخاصة", subTitle = "منتج جديد ومميز";
  int id = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 43, 33, 54),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 18, 14, 22),
          leading: Container(),
          actions: [
            ShaderMask(
              shaderCallback: (rec) =>
                  LinearGradient(colors: colors).createShader(rec),
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/readyorder.png",
                  fit: BoxFit.cover,
                  height: height * 0.3,
                ),
              ),
              Text(
                "طلبك ارسل للمراسيل الابطال شوية \n وهتوصلك في صفحة الطبات",
                style: headLineTextStyle,
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Orders(),
                    ),
                  );
                  var order = OrdersClass({
                    'id': id,
                    'title': title,
                    'subTitle': subTitle,
                  });
                  int ids = await helper.createOrders(order);
                  print(ids);
                },
                child: buttons(
                  title: "صفحة طلباتي",
                  font: 16.0,
                  height: height * 0.06,
                  width: width * 0.6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
