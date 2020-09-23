import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            border:
                Border.all(style: BorderStyle.solid, color: Colors.transparent),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 1, 130, 158),
                Color.fromARGB(255, 97, 36, 209),
              ],
            )),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 0),
                child: ShaderMask(
                  shaderCallback: (rec) {
                    return LinearGradient(
                      colors: [
                        Color.fromARGB(255, 97, 36, 209),
                        Color.fromARGB(255, 1, 130, 158),
                      ],
                    ).createShader(rec);
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "أبحث عن مطعم , كوفي ,أي مكان",
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
