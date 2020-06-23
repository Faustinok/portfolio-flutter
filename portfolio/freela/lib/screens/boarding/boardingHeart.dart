import 'package:flutter/material.dart';

class BoardingHeart extends StatelessWidget {
  var color = const Color(0xffb74093);
  Color c = const Color(0x9378FF);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/imagens/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: Text(
              "Spiice",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontFamily: "Google",
                  fontWeight: FontWeight.normal,
                  fontSize: 30),
            ),
          ),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005),
                child: Center(
                  child: Image.asset(
                    "assets/imagens/heart.png",
                    scale: 1.3,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.7,
                        left: 20),
                    child: Center(
                      child: Text(
                        "Find projects from companies",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontFamily: "Google",
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
