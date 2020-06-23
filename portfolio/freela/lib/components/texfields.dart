import 'package:flutter/material.dart';

class TexfieldComponent extends StatelessWidget {
  String label;
  TextEditingController controller = new TextEditingController();
  bool obscure;
  TextInputType textInputType;
  TexfieldComponent(
      {@required this.label,
      @required this.controller,
      @required this.obscure,
      @required this.textInputType});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 15),
      child: TextField(
        controller: this.controller,
        obscureText: this.obscure,
        keyboardType: this.textInputType,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(251, 238, 255, 1),
            labelText: this.label,
            labelStyle: TextStyle(
              color: Color.fromRGBO(153, 135, 157, 1),
            ),
            border: OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            )),
      ),
    );
  }
}
