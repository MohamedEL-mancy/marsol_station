import 'package:flutter/material.dart';

import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets/screens_widgets/settings_widgets.dart';

class Settings extends StatelessWidget {
  static String id = "Settings";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 38, 29, 47),
        appBar: AppBar(
          toolbarHeight: height * 0.06,
          title: Text("الإعدادات"),
          centerTitle: true,
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
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.06,
                margin: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: ShaderMask(
                      shaderCallback: (rec) =>
                          LinearGradient(colors: colors).createShader(rec),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/icons/setting_username.png",
                      height: height * 0.1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "اسم المستخدم",
                          style: headLineTextStyle,
                        ),
                        Text(
                          "marsol@gmail.com",
                          style: describtionTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              containerProfileSetting(height: height * 0.45),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/profile/cobonat.png",
                          height: height * 0.1,
                        ),
                        Text(
                          "إعدادات البطاقة",
                          style: headLineTextStyle,
                        )
                      ],
                    ),
                    Text(
                      "تعديل",
                      style: describtionTextStyle,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Text(
                  "البطاقة الإفتراضية",
                  style: describtionTextStyle,
                ),
              ),
              containerAppSetting(height: height * 0.3)
            ],
          ),
        ),
      ),
    );
  }
}
