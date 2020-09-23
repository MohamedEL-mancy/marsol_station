import 'package:flutter/material.dart';
import 'package:marsol/constants/lists_widgets.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/screens/SearchBarWidget.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ListsProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 27, 44),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(255, 20, 16, 25),
                      Color.fromARGB(255, 28, 22, 35),
                    ],
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SearchBarWidget(),
                        SizedBox(
                          height: 10.0,
                        ),
                        titleWithBorder(
                            title: "الاسر المنتجة",
                            topSpace: 0.0,
                            bottomSpace: 0.0),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        Container(
                          height: height * 0.2,
                          width: double.infinity,
                          color: Colors.transparent,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor:
                                        Color.fromARGB(255, 1, 130, 158),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 32,
                                      backgroundImage:
                                          AssetImage("assets/images/logo.png"),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                  child: titleWithBorder(
                    title: "المتاجر",
                    topSpace: 0.0,
                    bottomSpace: 0.0,
                    width: 90,
                  ),
                ),
                Container(
                  height: height * 0.07,
                  margin: EdgeInsets.only(right: 10.0),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            active = index;
                          });
                          print(index);
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              padding: EdgeInsets.all(5.0),
                              width: 80.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  tileMode: TileMode.mirror,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: active == index
                                      ? data.activeColors
                                      : data.inActive,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                data.types[index],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: active != index
                                        ? Colors.black
                                        : Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                gridViewDetialsHomePage(indexes: active, context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
