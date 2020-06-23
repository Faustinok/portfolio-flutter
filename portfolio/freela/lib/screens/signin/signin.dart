import 'package:flutter/material.dart';
import 'package:freela/components/texfields.dart';

class SignIn extends StatelessWidget {
  TextEditingController txtnome = TextEditingController();
  TextEditingController txtsobrenome = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Center(
                  child: Text(
                    "Sign-up",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontFamily: "Google",
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TexfieldComponent(
                    label: "First name",
                    controller: txtnome,
                    obscure: false,
                    textInputType: TextInputType.text),
              ),
              TexfieldComponent(
                  label: "Last name",
                  controller: txtsobrenome,
                  obscure: false,
                  textInputType: TextInputType.text),
              TexfieldComponent(
                  label: "Email",
                  controller: txtnome,
                  obscure: false,
                  textInputType: TextInputType.text),
              TexfieldComponent(
                  label: "Password",
                  controller: txtnome,
                  obscure: false,
                  textInputType: TextInputType.text),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: RaisedButton(
                  color: Color.fromRGBO(147, 120, 255, 1),
                  //Color.fromRGBO(147, 120, 255, 1),
                  padding: EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 80.0, right: 80.0),
                  child: Text(
                    "Sign up",
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
                  onPressed: () {},
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
        ));
  }
}
