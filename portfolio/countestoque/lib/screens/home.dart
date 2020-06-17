import 'package:countestoque/screens/components/cards.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/caixa.png",
              width: 35,
              height: 35,
            ),
            title: Text(
              "Conferir",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/estoque.png",
              width: 35,
              height: 35,
            ),
            title: Text(
              "data",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/mais.png",
              width: 35,
              height: 35,
            ),
            title: Text(
              "Cadastrar",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
