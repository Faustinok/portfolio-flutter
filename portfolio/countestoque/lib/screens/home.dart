import 'package:countestoque/model/produto.dart';
import 'package:countestoque/screens/listaProdutos.dart';
import 'package:countestoque/screens/conferirProdutos.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';

class Home extends StatefulWidget {
  int tela = -1;

  Home({this.tela});
  @override
  _HomeState createState() => _HomeState(tela: tela);
}

class _HomeState extends State<Home> {
  int tela = -1;
  _HomeState({this.tela});
  int _currentindex = 1;
  final List<Widget> telas = [ConferirProdutos(), ListaProdutos(), Cadastro()];
  trocaTela(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  _escolhaTela() {
    if (tela == null) {
      setState(() {
        _currentindex = 1;
      });
    } else {
      setState(() {
        _currentindex = tela;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _escolhaTela();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => trocaTela(index),
        backgroundColor: Colors.lightBlue,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/caixa.png",
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            title: Text(
              "Conferir",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/estoque.png",
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            title: Text(
              "Produtos",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/mais.png",
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            title: Text(
              "Cadastrar",
              style: TextStyle(
                  fontSize: 13,
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
