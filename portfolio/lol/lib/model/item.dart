class Item {
  String name;
  String description;
  String plaintext;
  List<dynamic> into;
  String image;
  int goldBase;
  bool ispurchasable;
  int goldTotal;
  int goldSell;
  String urlImages = "http://ddragon.leagueoflegends.com/cdn/10.16.1/img/item/";

  Item.fromApi(Map<String, dynamic> map) {
    this.name = map["name"];
    this.description = removeAllHtmlTags(map["description"]);
    this.plaintext = map["plaintext"];
    this.into = map["into"];
    this.image = urlImages + map["image"]["full"];
    this.goldBase = map["gold"]["base"];
    this.ispurchasable = map["gold"]["purchasable"];
    this.goldTotal = map["gold"]["total"];
    this.goldSell = map["gold"]["sell"];
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
