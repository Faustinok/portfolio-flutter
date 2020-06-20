import 'dart:io';

import 'package:countestoque/dao/produtoDao.dart';
import 'package:countestoque/model/produto.dart';
import 'package:countestoque/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/customTextfield.dart';
import 'home.dart';

class ConferirProdutos extends StatefulWidget {
  @override
  _ConferirProdutosState createState() => _ConferirProdutosState();
}

class _ConferirProdutosState extends State<ConferirProdutos> {
  TextEditingController txtqtde = TextEditingController();
  Produto produto;
  String valor;
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  criaProduto() async {
    String idProduto = await LocalStorage.getValue<String>("idproduto");
    print("tela: $idProduto");
    if (idProduto != null) {
      ProdutoDao produtoDao = ProdutoDao.vazio();
      produto = await produtoDao.selectProductById(int.parse(idProduto));
      setState(() {
        produto = produto;
        valor = oCcy.format(produto.preco);
      });
    } else {
      setState(() {
        produto = null;
      });
    }
  }

  mostraProduto(Produto produto) {
    if (produto == null) {
      return Center(
        child: Text("Selecione o produto na tela de listagem"),
      );
    } else {
      return ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: produto.imagem.toString().isEmpty
                      ? Image.asset(
                          "assets/caixa.png",
                          width: 200,
                          height: 200,
                        )
                      : Image.file(
                          File(produto.imagem),
                          width: 180,
                          height: 180,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: Text(
                    produto.nome,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8.0),
                child: Text("Descrição:"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Text(
                  produto.descricao,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8.0),
                child: Text(
                  "Valor: $valor",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8.0),
                child: Text(
                  "Estoque atual: ${produto.quantidade}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TexfieldComponent(
                controller: txtqtde,
                label: "Quantidade conferida",
                textInputType: TextInputType.number,
                obscure: false,
              )
            ],
          )
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    criaProduto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Conferir produtos",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          produto.quantidade = int.parse(txtqtde.text);
          ProdutoDao produtoDao = ProdutoDao.vazio();
          await produtoDao.updatetProduct(produto);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home(tela: 1)),
              (Route<dynamic> route) => false);
        },
        child: Icon(Icons.save),
      ),
      body: mostraProduto(produto),
    );
  }
}
