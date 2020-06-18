import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database _db;
Future<Database> get db async {
  if (_db != null) {
    return _db;
  }
  _db = await initDb();
  return _db;
}

Future<Database> initDb() async {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'estoque.db');
    return openDatabase(
      // Set the path to the database.
      join(path, 'unibanc.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        db.execute(
            "create table produtos(idproduto integer primary key,nome text,descricao text,imagem text,preco real,quantidade integer);");
      },
      version: 1,
    );
  });
}
