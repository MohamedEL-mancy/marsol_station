import 'package:flutter/material.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/navigation_animation.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/screens/Registration.dart';

import 'package:marsol/screens/pages.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 28, 45),
      //resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/sign_in.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height * 0.5,
                  ),
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 21, 16, 26),
                          Color.fromARGB(255, 22, 18, 28),
                          Color.fromARGB(255, 27, 21, 34),
                          Color.fromARGB(255, 34, 26, 42),
                          Color.fromARGB(255, 38, 29, 47),
                          Color.fromARGB(255, 55, 42, 69),
                          Color.fromARGB(255, 56, 43, 70),
                        ],
                      ),
                    ),
                    alignment: Alignment.centerRight,
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    child: Container(
                      margin:
                          EdgeInsets.only(right: 25.0, bottom: 5.0, top: 5.0),
                      child: customText(title: "تسجيل الدخول", font: 20),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      height: height * 0.1,
                      width: width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (val) => val.isEmpty
                                  ? "يجب ادخال رقم الهاتف عند الدخول"
                                  : null,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 20.0),
                                hintText: "00000000000000",
                                border: InputBorder.none,
                                alignLabelWithHint: true,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            indent: 5,
                            endIndent: 5.0,
                          ),
                          Container(
                            color: Colors.white,
                            child: Text(
                              "966+",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              //textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(right: 10.0, top: 10.0, bottom: 5.0),
                    child: Text(
                      "أو سجل الدخول عن طريق حسابك في مواقع التواصل الإجتماعي",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 50, 204, 254),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          height: 40.0,
                          width: 100.0,
                          child: Center(
                            child: Text(
                              "Twitter",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 72, 103, 170),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          height: 40.0,
                          width: 100.0,
                          child: Center(
                            child: Text(
                              "facebook",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        NavigationPages(
                          page: Pages(),
                        ),
                      );
                    },
                    child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 15.0, top: 10.0),
                        child: customText(title: "تخطي", font: 20)),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState.validate()) {
                          Navigator.pushNamed(context, Registration.id);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child:
                            buttons(title: "دخول", height: 30.0, width: 120.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
