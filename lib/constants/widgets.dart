import 'package:flutter/material.dart';
import 'package:marsol/constants/lists_widgets.dart';
import 'package:marsol/screens/details.dart';
import 'package:provider/provider.dart';
import 'colors_app.dart';

import 'custom_texts.dart';

Widget titleWithBorder(
    {String title, double topSpace, double bottomSpace, double width}) {
  return Container(
    width: width,
    padding: EdgeInsets.only(left: 1.0, right: 1.0),
    decoration: BoxDecoration(
        border: Border.all(
            style: BorderStyle.solid, color: Colors.transparent, width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 97, 36, 209),
            Color.fromARGB(255, 1, 130, 158),
          ],
        )),
    child: Container(
      padding: EdgeInsets.only(
          left: 10.0, right: 10.0, top: topSpace, bottom: bottomSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromARGB(255, 33, 25, 41),
      ),
      child: ShaderMask(
        shaderCallback: (rec) => LinearGradient(colors: [
          Color.fromARGB(255, 97, 36, 209),
          Color.fromARGB(255, 1, 130, 158),
        ]).createShader(rec),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget gridViewDetialsHomePage({int indexes, @required BuildContext context}) {
  var data = Provider.of<ListsProvider>(context);
  return Container(
    height: 200.0,
    margin: EdgeInsets.all(10.0),
    child: GridView.builder(
        itemCount: indexes == 0
            ? data.allGridView.length
            : indexes == 1
                ? data.fashions.length
                : indexes == 2
                    ? data.tagmel.length
                    : indexes == 3
                        ? data.pharmacys.length
                        : indexes == 4
                            ? data.cafes.length
                            : indexes == 5 ? data.restaurants.length : null,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //  Navigator.pushNamed(context, Details.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    index: index,
                  ),
                ),
              );
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/canada.png"),
                  radius: 30.0,
                ),
                SizedBox(height: 5.0),
                Text(
                  indexes == 0
                      ? data.allGridView[index]
                      : indexes == 1
                          ? data.fashions[index]
                          : indexes == 2
                              ? data.tagmel[index]
                              : indexes == 3
                                  ? data.pharmacys[index]
                                  : indexes == 4
                                      ? data.cafes[index]
                                      : indexes == 5
                                          ? data.restaurants[index]
                                          : null,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }),
  );
}

Widget buttons({String title, double height, double width, double font}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        tileMode: TileMode.mirror,
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromARGB(255, 15, 117, 165),
          Color.fromARGB(255, 15, 117, 165),
          Color.fromARGB(255, 52, 80, 186),
          Color.fromARGB(255, 52, 80, 186),
          Color.fromARGB(255, 121, 13, 221),
          Color.fromARGB(255, 121, 13, 221)
        ],
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: font,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        //textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget ratesUserStars() {
  return ShaderMask(
    shaderCallback: (rect) => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: colors,
    ).createShader(rect),
    child: Icon(
      Icons.star_border,
      color: Colors.white,
      size: 30.0,
    ),
  );
}

Widget marketProfile(
    {String title, String detailsTitle, Function function, String imageIcon}) {
  return GestureDetector(
    onTap: function,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.0, top: 5.0),
              child: Row(
                children: [
                  Image.asset(
                    imageIcon,
                    height: 30.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Text(
                      title,
                      style: normalTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            title == "الكوبونات"
                ? Container(
                    margin: EdgeInsets.only(left: 5.0, top: 5.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: colors),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.transparent,
                          width: 2.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 51, 39, 64),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Text(
                        "إضافة كوبون",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Text(
                        detailsTitle,
                        style: normalTextStyle,
                      ),
                      ShaderMask(
                        shaderCallback: (rec) =>
                            LinearGradient(colors: colors).createShader(rec),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Divider(
                thickness: 2.0,
                color: Color.fromARGB(255, 1, 130, 158),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2.0,
                color: Color.fromARGB(255, 135, 0, 229),
              ),
            )
          ],
        )
      ],
    ),
  );
}
