import 'package:flutter/material.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets.dart';
import 'package:marsol/constants/widgets/screens_widgets/registration_widgets.dart';
import 'package:marsol/screens/pages.dart';

class Registration extends StatefulWidget {
  static String id = "Registration";
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool male = false;
  bool female = false;
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  double buttonName = 0.0;
  double buttonEmail = 0.0;
  int selected = 1930;
  List<DropdownMenuItem> years = [];
  @override
  void initState() {
    super.initState();
    for (int year = 1930; year < 2003; year++) {
      years.add(
        DropdownMenuItem(
          child: Text(year.toString()),
          value: year,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromARGB(255, 50, 38, 62),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0, top: 10.0),
                      child: customText(font: 18.0, title: "صفحة التسجيل"),
                    ),
                    Form(
                      key: formKey1,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: buttonName),
                            child: buttons(
                              title: "الأسم",
                              font: 16.0,
                              height: 30.0,
                              width: 120.0,
                            ),
                          ),
                          Expanded(
                            child: registrationFields(
                                title: "الأسم",
                                validate: "من فضلك أدخل الأسم",
                                type: TextInputType.name,
                                function: (value) {
                                  print(value);
                                }),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: formKey2,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: buttonEmail),
                            child: buttons(
                              title: "البريد الإلكتروني",
                              font: 16.0,
                              height: 30.0,
                              width: 120.0,
                            ),
                          ),
                          Expanded(
                            child: registrationFields(
                              type: TextInputType.emailAddress,
                              validate: "من فضلك أدخل البريد الإلكتروني",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        buttons(
                          title: "سنة الميلاد",
                          font: 16.0,
                          height: 30.0,
                          width: 120.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              )),
                          height: height * 0.07,
                          width: 120,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: selected,
                              items: years,
                              onChanged: (value) {
                                setState(() {
                                  selected = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: customText(
                            title: "ذكر",
                            font: 20.0,
                          ),
                        ),
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: male,
                            onChanged: (value) {
                              setState(() {
                                male = value;
                              });
                              if (male) {
                                setState(() {
                                  female = false;
                                });
                              }

                              print(value);
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        customText(title: "أنثي", font: 20.0),
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: female,
                            onChanged: (value) {
                              setState(() {
                                female = value;
                              });
                              if (female) {
                                setState(() {
                                  male = false;
                                });
                              }
                            },
                            activeColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    socialButtons(),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: GestureDetector(
                        onTap: () {
                          if (formKey1.currentState.validate()) {
                            setState(() {
                              buttonName = 0.0;
                            });
                          } else {
                            setState(() {
                              buttonName = 30;
                            });
                          }
                          if (formKey2.currentState.validate()) {
                            setState(() {
                              buttonEmail = 0.0;
                            });
                          } else {
                            buttonEmail = 30.0;
                          }

                          if (formKey1.currentState.validate() &&
                              formKey2.currentState.validate()) {
                            Navigator.pushNamed(context, Pages.id);
                          }
                        },
                        child: buttons(
                          title: "التسجيل",
                          font: 18.0,
                          width: 170.0,
                          height: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
