class Produto {
  int _idproduto;
  String _nome;
  String _descricao;
  String _imagem;
  double _preco;
  int _quantidade;
  Produto.vazio();
  Produto(
      this._nome, this._descricao, this._quantidade, this._preco, this._imagem);
  Produto.confere(this._nome, this._descricao, this._quantidade, this._imagem);
  get nome => _nome;
  get descricao => _descricao;
  get imagem => _imagem;
  get quantidade => _quantidade;
  get idproduto => _idproduto;
  get preco => _preco;
  set quantidade(int qtde) => _quantidade = qtde;
  Produto.fromMap(Map map) {
    _idproduto = map["idproduto"];
    _nome = map["nome"];
    _descricao = map["descricao"];
    _imagem = map["imagem"];
    _quantidade = map["quantidade"];
    _preco = map["preco"];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "descricao": descricao,
      "imagem": imagem,
      "quantidade": quantidade,
      "preco": preco
    };
    if (idproduto != null) {
      map["idproduto"] = idproduto;
    }
    return map;
  }
}
