import 'package:countestoque/screens/listaProdutos.dart';
import 'package:countestoque/screens/conferirProdutos.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentindex = 1;
  final List<Widget> telas = [ConferirProdutos(), ListaProdutos(), Cadastro()];
  trocaTela(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => trocaTela(index),
        backgroundColor: Colors.lightBlue,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/caixa.png",
              color: Colors.white,
              width: 35,
              height: 35,
            ),
            title: Text(
              "Conferir",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/estoque.png",
              color: Colors.white,
              width: 35,
              height: 35,
            ),
            title: Text(
              "Produtos",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/mais.png",
              color: Colors.white,
              width: 35,
              height: 35,
            ),
            title: Text(
              "Cadastrar",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
      body: telas[_currentindex],
    );
  }
}
