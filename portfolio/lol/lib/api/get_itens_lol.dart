import 'dart:convert';
import 'package:lol/model/item.dart';
import 'package:http/http.dart' as http;

class ApiHttp {
  Item item;

  Future<List<Item>> getApiDataItens() async {
    List<Item> itens = List();
    var response = await http.get(
        "http://ddragon.leagueoflegends.com/cdn/10.16.1/data/pt_BR/item.json");
    var mapItens = json.decode(response.body);
    mapItens["data"].forEach((key, value) {
      item = Item.fromApi(value);
      itens.add(item);
    });
    return itens;
  }
}
