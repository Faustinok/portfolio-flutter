import 'package:flutter/material.dart';
import 'package:freela/screens/boarding/boardingPrincipal.dart';

class Boarding extends StatelessWidget {
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
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Text(
              "Spiice",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontFamily: "Google",
                  fontWeight: FontWeight.bold,
                  fontSize: 80),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: RaisedButton(
              color: Color.fromRGBO(147, 120, 255, 1),
              //Color.fromRGBO(147, 120, 255, 1),
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 50.0, right: 50.0),
              child: Text(
                "Discover the plataform",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: 'Google',
                  fontWeight: FontWeight.normal,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => BoardingPrincipal()),
                    (Route<dynamic> route) => false);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15),
              child: Row(
                children: <Widget>[
                  Text(
                    "You have an account ? ",
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(18, 14, 33, 1),
                    ),
                  ),
                  Text(
                    "Log-in",
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Color.fromRGBO(18, 14, 33, 1),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
