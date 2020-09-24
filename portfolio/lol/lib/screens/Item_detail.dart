import 'package:flutter/material.dart';
import 'package:lol/model/item.dart';
import 'dart:convert' show utf8;

import 'package:transparent_image/transparent_image.dart';

class Itemdetail extends StatelessWidget {
  Item item;

  List<String> itensAdjacentes = List();

  Itemdetail({@required this.item});
  @override
  Widget build(BuildContext context) {
    item.into.forEach((element) {
      itensAdjacentes.add(item.urlImages + element + '.png');
    });
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 52, 52, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Center(
              child: Image.network(item.image),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              utf8.decode(item.name.codeUnits),
              style: TextStyle(color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Center(
              child: Text(
                utf8.decode(item.description.codeUnits),
                style: TextStyle(color: Colors.greenAccent),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Divider(
              color: Colors.amber,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: itensAdjacentes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    itemBuilder: (context, index) {
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: itensAdjacentes[index],
                        width: 150.0,
                        height: 150.0,
                        fit: BoxFit.scaleDown,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
