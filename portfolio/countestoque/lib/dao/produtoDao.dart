import 'package:countestoque/backend/app_database.dart';
import 'package:countestoque/model/produto.dart';

class ProdutoDao {
  ProdutoDao.vazio();
  Future<int> insertProduct(Produto produto) async {
    return initDb().then((db) {
      return db.insert("produtos", produto.toMap());
    });
  }

  Future<Produto> selectProductById(int idd) async {
    var client = await db;
    Produto produto;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query('produtos', where: 'idproduto = ?', whereArgs: [idd]);
    var maps = await futureMaps;
    if (maps.length != 0) {
      produto = Produto.fromMap(maps.first);
      print(produto.nome);
      return produto;
    } else {
      return null;
    }
  }

  Future<List<Produto>> selectProducts() async {
    var client = await db;
    Produto produto;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query("produtos");
    var maps = await futureMaps;
    print(maps.length);
    List<Produto> produtos = List();
    if (maps.length != 0) {
      for (Map<String, dynamic> map in maps) {
        produto = Produto.fromMap(map);
        produtos.add(produto);
      }
      return produtos;
    }
  }

  Future<int> updatetProduct(Produto produto) async {
    return initDb().then((db) {
      return db.update("produtos", produto.toMap(),
          where: "idproduto = ?", whereArgs: [produto.idproduto]);
    });
  }
}
