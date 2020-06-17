import 'package:countestoque/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CountEstoque());
}

class CountEstoque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
