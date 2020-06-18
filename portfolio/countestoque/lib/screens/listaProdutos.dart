import 'dart:io';

import 'package:countestoque/dao/produtoDao.dart';
import 'package:countestoque/model/produto.dart';
import 'package:flutter/material.dart';

class ListaProdutos extends StatelessWidget {
  ProdutoDao produtoDao = ProdutoDao.vazio();

  _createListTile(Produto produto) {
    return ListTile(
      leading: produto.imagem == ""
          ? Image.asset("assets/caixa.png")
          : Image.file(File(produto.imagem)),
      title: Text(produto.nome),
      subtitle: Text(produto.descricao),
      isThreeLine: true,
      trailing: Text("qtde: ${produto.quantidade}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Lista de produtos",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 2))
            .then((value) => produtoDao.selectProducts()),
        builder: (context, snaphot) {
          switch (snaphot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando")
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              List<Produto> produtos = snaphot.data;
              return ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return _createListTile(produtos[index]);
                },
              );
          }
        },
      ),
    );
  }
}
