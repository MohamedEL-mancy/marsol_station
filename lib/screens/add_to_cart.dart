import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/constants/widgets/screens_widgets/addtocart_widgets.dart';
import 'package:marsol/screens/check_out.dart';

class AddToCart extends StatefulWidget {
  static String id = "AddToCart";
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  double number = 1.0;
  void plus() {
    setState(() {
      number++;
    });
  }

  void minus() {
    setState(() {
      if (number <= 0) {
        setState(() {
          number = 0;
        });
      } else {
        number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 45, 34, 56),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
          ),
          child: Badge(
            borderRadius: 20.0,
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
              color: Colors.white,
            ),
            badgeColor: Colors.white,
            badgeContent: Text(
              "1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.topRight,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        appBar: AppBar(
          toolbarHeight: height * 0.07,
          backgroundColor: Colors.black,
          leading: ShaderMask(
            shaderCallback: (rec) =>
                LinearGradient(colors: colors).createShader(rec),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30.0,
            ),
          ),
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: height * 0.3,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2015/02/24/15/41/dog-647528__340.jpg",
                  placeholder: (context, url) => Image.asset(
                    "assets/icons/camera.png",
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: 16.0, top: 10.0, right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "مننج",
                              style: headLineTextStyle,
                            ),
                            Text(
                              "\$8.00",
                              style: headLineTextStyle,
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "الوصف",
                          style: describtionTextStyle,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buttons(
                              title: "Not Deliverable",
                              height: height * 0.05,
                              width: width * 0.4,
                              font: 16.0,
                            ),
                            Row(
                              children: [
                                buttons(
                                    title: "4 كج",
                                    height: height * 0.04,
                                    width: width * 0.2,
                                    font: 16.0),
                                SizedBox(width: 5.0),
                                buttons(
                                    title: "6 عناصر",
                                    height: height * 0.04,
                                    width: width * 0.2,
                                    font: 16.0),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Divider(color: Colors.purple),
                        Row(
                          children: [
                            addPlusCircle(),
                            SizedBox(width: 5.0),
                            Text(
                              "الإعدادات",
                              style: headLineTextStyle,
                            )
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "حدد خيارًا لإضافتها على المنتج",
                          style: describtionTextStyle,
                        ),
                        Divider(color: Colors.purple),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                color: Colors.transparent,
                                border:
                                    Border.all(width: 1.0, color: Colors.white),
                              ),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              "المراجعات",
                              style: headLineTextStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: height * 0.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: colors,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          padding: EdgeInsets.only(
                              top: 10.0, right: 10.0, left: 10.0),
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "الكمية",
                                    style: headLineTextStyle,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          minus();
                                        },
                                        child: circlesAddMinus(
                                          icon: FontAwesomeIcons.minus,
                                        ),
                                      ),
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
                                          child: circlesAddMinus(
                                              icon: FontAwesomeIcons.plus)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 20.0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, CheckOut.id);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: width * 0.6,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30.0),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("أضف إلى السلة",
                                              style: blackTexts),
                                          Text(
                                            "\$ 8.00",
                                            style: blackTexts,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
