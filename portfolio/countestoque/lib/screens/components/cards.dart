import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  String title;
  String asset;
  Function ontap;
  Cards({@required this.title, @required this.asset});
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.0,
        margin: EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            color: Colors.lightBlue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  asset,
                  width: 100,
                  height: 100,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          onTap: () => ontap,
        ));
  }
}
