import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets/screens_widgets/details_screen_widgets.dart';
import 'package:marsol/screens/add_to_cart.dart';
import 'package:marsol/screens/check_out.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  static String id = "Details";
  final int index;
  Details({this.index});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DetailsWidgets>(context);
    // double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CheckOut.id);
          },
          child: Container(
            height: 40.0,
            width: 50.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: data.detailsBoxColors),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            child: Badge(
              child: Image.asset(
                "assets/icons/shopping.png",
                color: Colors.white,
              ),
              badgeContent: Text("1"),
              badgeColor: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        backgroundColor: Color.fromARGB(255, 45, 34, 56),
        appBar: AppBar(
          toolbarHeight: 40.0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: ShaderMask(
            shaderCallback: (rec) =>
                LinearGradient(colors: colors).createShader(rec),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              iconSize: 30.0,
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: Container(),
                  expandedHeight: 200,
                  backgroundColor: Colors.blue,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Hero(
                      tag: "image",
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl:
                            "https://cdn.pixabay.com/photo/2015/02/24/15/41/dog-647528__340.jpg",
                        placeholder: (context, url) => Image.asset(
                          "assets/icons/camera.png",
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "منتج جديد ",
                              style: headLineTextStyle,
                            ),
                            data.detailsBox(
                              height: 30,
                              width: 70.0,
                              title: "3.0",
                              widget: Icon(
                                Icons.star_border,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                data.detailsBox(
                                  height: 25,
                                  width: 90.0,
                                  title: "مفتوح",
                                  widget: Container(),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                data.detailsBox(
                                  height: 25,
                                  width: 90.0,
                                  title: "التقط",
                                  widget: Container(),
                                ),
                              ],
                            ),
                            data.detailsBox(
                              height: 25,
                              width: 90.0,
                              title: "0.0 كم",
                              widget: Container(),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                            "هذا المنتج يوجد منة كثير من الأصناف وبة مميزات كثيرة وموجود في جميع فروعنا بأسعار مميزة جدا ",
                            maxLines: 3,
                            style: describtionTextStyle,
                          ),
                        ),
                        Container(
                          height: 150,
                          margin: EdgeInsets.only(top: 10.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 250,
                                margin: EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: "",
                                  placeholder: (context, url) => Opacity(
                                    opacity: 0.5,
                                    child: Image.asset(
                                      "assets/icons/camera.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        data.information(title: "االمعلومات"),
                        data.featuredProducts(
                            title: "منتجات مميزة  ",
                            productName: "ألبان",
                            function: () {
                              Navigator.pushNamed(context, AddToCart.id);
                            }),
                        data.whatThaySay(title: "ماذا يقولون؟"),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // Positioned(
            //   top: height * 0.8,
            //   right: 10,
            //   child: Container(
            //     padding: EdgeInsets.only(left: 10.0, right: 10.0),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.0),
            //       gradient: LinearGradient(
            //         colors: data.detailsBoxColors,
            //       ),
            //     ),
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           "assets/icons/bag.png",
            //           height: 30.0,
            //         ),
            //         Text(
            //           "Shopping",
            //           style: normalTextStyle,
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
