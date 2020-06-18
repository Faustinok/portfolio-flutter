import 'dart:io';

import 'package:countestoque/dao/produtoDao.dart';
import 'package:countestoque/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'components/customTextfield.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String image = "assets/caixa.png";
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtdescricao = TextEditingController();
  TextEditingController txtquantidade = TextEditingController();
  TextEditingController txtpreco = TextEditingController();
  _pickCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      image = pickedFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Cadastro de produtos",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String imagem = "";
          if (image != "assets/caixa.png") {
            imagem = image;
          }

          Produto produto = Produto(
              txtNome.text,
              txtdescricao.text,
              int.parse(txtquantidade.text),
              double.parse(txtpreco.text),
              imagem);
          ProdutoDao produtoDao = ProdutoDao.vazio();
          await produtoDao.insertProduct(produto);
          setState(() {
            txtNome.clear();
            txtdescricao.clear();
            txtquantidade.clear();
            txtpreco.clear();
            image = "assets/caixa.png";
          });
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(child: Text("Produto salvo!")),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text("Ok"),
                      )
                    ],
                  );
                });
          });
        },
        child: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: _pickCamera,
              child: Image.asset(
                image,
                width: MediaQuery.of(context).size.width,
                height: image == "assets/caixa.png"
                    ? MediaQuery.of(context).size.height * 0.2
                    : MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            TexfieldComponent(
              controller: txtNome,
              label: "Nome do produto",
              textInputType: TextInputType.text,
              obscure: false,
            ),
            TexfieldComponent(
              controller: txtdescricao,
              label: "Descrição",
              textInputType: TextInputType.text,
              obscure: false,
            ),
            TexfieldComponent(
              controller: txtquantidade,
              label: "Quantidade",
              textInputType: TextInputType.number,
              obscure: false,
            ),
            TexfieldComponent(
              controller: txtpreco,
              label: "Preço",
              textInputType: TextInputType.text,
              obscure: false,
            ),
          ],
        ),
      ),
    );
  }
}
