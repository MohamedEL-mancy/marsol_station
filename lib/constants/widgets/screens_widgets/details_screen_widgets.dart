import 'package:flutter/material.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets.dart';

class DetailsWidgets extends ChangeNotifier {
  List<Color> detailsBoxColors = [
    Color.fromARGB(255, 1, 130, 158),
    Color.fromARGB(255, 1, 130, 158),
    Color.fromARGB(255, 133, 2, 228)
  ];
  Widget detailsBox(
      {String title, double width, double height, Widget widget}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: detailsBoxColors,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: normalTextStyle,
            textAlign: TextAlign.center,
          ),
          widget
        ],
      ),
    );
  }

  Widget information({String title}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: detailsBoxColors,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Icon(Icons.star_border, color: Colors.white),
                Text(
                  title,
                  style: headLineTextStyle,
                )
              ],
            ),
          ),
        ),
        Text(
          "هذا المنتج يوجد منة كثير من الأصناف وبة مميزات كثيرة وموجود في جميع فروعنا بأسعار مميزة جدا ونحيطك علما ان يوجد حصم للعملاء الجدد علي هذا المنتج ",
          maxLines: 3,
          style: describtionTextStyle,
        ),
        Divider(color: Colors.purple),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200.0,
              child: Text(
                "392 عنوان المكان والشارع  ",
                style: describtionTextStyle,
              ),
            ),
            Container(
              height: 40.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: detailsBoxColors),
                borderRadius: BorderRadius.all(
                  Radius.circular(80.0),
                ),
              ),
              child: Image.asset(
                "assets/icons/arrow_address.png",
              ),
            )
          ],
        ),
        Divider(color: Colors.purple),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              child: Text(
                "555-444-555-5555-222+2(055) 1234567890",
                style: describtionTextStyle,
                maxLines: 2,
              ),
            ),
            Container(
              height: 40.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: detailsBoxColors),
                borderRadius: BorderRadius.all(
                  Radius.circular(80.0),
                ),
              ),
              child: Image.asset(
                "assets/icons/phone.png",
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget featuredProducts(
      {String title, String productName, Function function}) {
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: detailsBoxColors,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 10.0),
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/bag.png",
                    color: Colors.white,
                  ),
                  Text(
                    title,
                    style: headLineTextStyle,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/icons/camera.png"),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: normalTextStyle,
                    ),
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
              )
            ],
          ),
          Divider(color: Colors.purple),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/icons/camera.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "KKj",
                          style: normalTextStyle,
                        ),
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
              Text(
                "\$ 8.00",
                style: normalTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget whatThaySay({String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: detailsBoxColors,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/person.png",
                  color: Colors.white,
                ),
                SizedBox(width: 5.0),
                Text(
                  title,
                  style: headLineTextStyle,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/icons/camera.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "أحمد عادل",
                          style: normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              detailsBox(
                title: "3.0",
                height: 30,
                width: 70.0,
                widget: Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Text(
            "منتج جديد ورائع وشكرا علي هذة الخدمة الممتازة وننتظر منكم كل جديد",
            style: describtionTextStyle,
            maxLines: 3,
          ),
        ),
        Divider(color: Colors.purple),
        Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/icons/camera.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "محمد أحمد",
                          style: normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              detailsBox(
                title: "3.0",
                height: 30,
                width: 70.0,
                widget: Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20.0, top: 10.0),
          child: Text(
            "منتج جديد ورائع وشكرا علي هذة الخدمة الممتازة وننتظر منكم كل جديد",
            style: describtionTextStyle,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
