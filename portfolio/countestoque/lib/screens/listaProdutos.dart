import 'dart:io';

import 'package:countestoque/dao/produtoDao.dart';
import 'package:countestoque/model/produto.dart';
import 'package:countestoque/preferences/preferences.dart';
import 'package:countestoque/screens/conferirProdutos.dart';
import 'package:countestoque/screens/home.dart';
import 'package:flutter/material.dart';

class ListaProdutos extends StatefulWidget {
  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  ProdutoDao produtoDao = ProdutoDao.vazio();
  List<Produto> allProducts = List();
  List<Produto> filter = List();
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initlista();
  }

  _initlista() async {
    allProducts = await produtoDao.selectProducts();
    setState(() {
      allProducts = allProducts;
    });
  }

  String idproduto;
  saveshared(Produto produto) async {
    LocalStorage.setValue<String>('idproduto', produto.idproduto.toString());
    String od = await LocalStorage.getValue<String>("idproduto");
    print("idProduto : ${produto.idproduto}");
    print("aqui 3 $od");
  }

  _createListTile(Produto produto) {
    return InkWell(
      onTap: () {
        saveshared(produto);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home(tela: 0)),
            (Route<dynamic> route) => false);
      },
      child: ListTile(
        leading: ClipOval(
          child: produto.imagem == ""
              ? Image.asset(
                  "assets/caixa.png",
                  width: 60.0,
                  height: 60.0,
                )
              : Image.file(
                  File(produto.imagem),
                  width: 60.0,
                  height: 60.0,
                ),
        ),
        title: Text(produto.nome),
        subtitle: Text(produto.descricao),
        isThreeLine: true,
        trailing: Text("qtde: ${produto.quantidade}"),
      ),
    );
  }

  filterProducts(String search) {
    List<Produto> produtos = List();
    produtos = allProducts;
    if (search.isNotEmpty) {
      List<Produto> results = List();
      produtos.forEach((element) {
        if (element.nome.toString().contains(search)) {
          results.add(element);
        }
        setState(() {
          filter = results;
        });
      });
    } else {
      setState(() {
        filter.removeRange(0, filter.length);
      });
    }
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
        body: Column(
          children: <Widget>[
            TextField(
              controller: editingController,
              onChanged: (value) {
                filterProducts(value);
              },
              decoration: InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    filter.isNotEmpty ? filter.length : allProducts.length,
                itemBuilder: (context, index) {
                  return _createListTile(
                      filter.isNotEmpty ? filter[index] : allProducts[index]);
                },
              ),
            )
          ],
        ));
  }
}
