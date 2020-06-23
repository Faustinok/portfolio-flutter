import 'package:flutter/material.dart';

class BoardingMoney extends StatelessWidget {
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
                    top: MediaQuery.of(context).size.height * 0.074),
                child: Center(
                  child: Image.asset(
                    "assets/imagens/money.png",
                    scale: 1.1,
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
                        "Make money while working",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontFamily: "Google",
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "       on awesome projects",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontFamily: "Google",
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
