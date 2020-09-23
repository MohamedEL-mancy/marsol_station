import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets/screens_widgets/orders_widgets.dart';
import 'package:marsol/models/db_helper.dart';
import 'package:marsol/models/orders_class.dart';

class Orders extends StatefulWidget {
  static String id = "Orders";

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 32, 52),
      appBar: AppBar(
        toolbarHeight: height * 0.06,
        backgroundColor: Color.fromARGB(255, 18, 14, 24),
        leading: ShaderMask(
          shaderCallback: (rec) =>
              LinearGradient(colors: colors).createShader(rec),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          "طلباتي",
          style: headLineTextStyle,
        ),
        centerTitle: true,
      ),
      floatingActionButton: floatingButtonStyle(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: FutureBuilder(
          future: helper.getAllOrders(),
          builder: (context, snapshots) {
            if (!snapshots.hasData) {
              return CircularProgressIndicator();
            } else if (snapshots.data.length == [].length) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/orders.png",
                      fit: BoxFit.cover,
                      height: height * 0.5,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "عفوا لم يوجد اوردرات",
                    style: describtionTextStyle,
                  )
                ],
              );
            }
            return ListView.builder(
                itemCount: snapshots.data.length,
                itemBuilder: (context, index) {
                  OrdersClass order =
                      OrdersClass.fromMap(snapshots.data[index]);

                  return Container(
                    width: 300.0,
                    height: 100.0,
                    margin: EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10.0, top: 10.0),
                              child: Icon(
                                Icons.donut_small,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "${order.title}",
                                  style: headLineTextStyle,
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: 200,
                                  child: Text(
                                    "${order.subTitle}",
                                    style: describtionTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              helper.deleteOrder(order.id);
                            });
                          },
                          child: Text(
                            "x1",
                            style: describtionTextStyle,
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
