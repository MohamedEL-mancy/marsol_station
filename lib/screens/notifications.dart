import 'package:flutter/material.dart';
import 'package:marsol/constants/colors_app.dart';
import 'package:marsol/constants/custom_texts.dart';
import 'package:marsol/constants/widgets/screens_widgets/notifications_widgets.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 29, 47),
      appBar: AppBar(
        toolbarHeight: height * 0.06,
        backgroundColor: Color.fromARGB(255, 18, 14, 22),
        title: Text(
          "التنبيهات",
          style: headLineTextStyle,
        ),
        centerTitle: true,
        leading: ShaderMask(
          shaderCallback: (rec) =>
              LinearGradient(colors: colors).createShader(rec),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButton: floatingButtonStyle(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/notifications.png",
              fit: BoxFit.cover,
              height: height * 0.5,
            ),
          ),
          Text(
            "لم يوجد وقت\n بقائمة التنبيهات",
            style: describtionTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
