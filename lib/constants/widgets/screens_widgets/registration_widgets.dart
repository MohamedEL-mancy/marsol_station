import 'package:flutter/material.dart';

Widget registrationFields(
    {String title, String validate, TextInputType type, Function function}) {
  return Container(
    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
    child: TextFormField(
      onChanged: function,
      keyboardType: type,
      validator: (value) => value.isEmpty ? validate : null,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.blue),
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            new EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    ),
  );
}

Widget socialButtons() {
  return Row(
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
  );
}
