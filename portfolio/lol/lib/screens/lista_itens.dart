import 'package:flutter/material.dart';
import 'package:lol/api/get_itens_lol.dart';
import 'package:lol/model/item.dart';
import 'dart:convert' show utf8;

import 'package:lol/screens/Item_detail.dart';

class ListaItens extends StatelessWidget {
  List<Item> itens = List();
  ApiHttp api = ApiHttp();
  getItens() async {
    itens = await api.getApiDataItens();
    print("aahs ");
  }

  @override
  Widget build(BuildContext context) {
    getItens();
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 52, 52, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(52, 52, 52, 1),
        centerTitle: true,
        title: Image.asset(
          "assets/lolzito.png",
          width: 150,
        ),
      ),
      body: ListView.separated(
        itemCount: itens.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.amber,
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Itemdetail(
                    item: itens[index],
                  ),
                ),
              );
            },
            child: ListTile(
              leading: ClipOval(
                child: Image.network(itens[index].image),
              ),
              title: Text(
                utf8.decode(itens[index].name.codeUnits),
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                utf8.decode(itens[index].description.codeUnits),
                style: TextStyle(color: Colors.greenAccent),
              ),
              isThreeLine: true,
              trailing: Text(
                "gold: ${itens[index].goldBase}",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          );
        },
      ),
    );
  }
}
