import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freela/screens/boarding/boardingArrow.dart';
import 'package:freela/screens/boarding/boardingPhone.dart';
import 'package:freela/screens/boarding/boardingWorld.dart';

import 'screens/boarding/boardingHeart.dart';
import 'screens/boarding/boardingMoney.dart';
import 'screens/boarding/boarding_home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
  );
  runApp(FreelaApp());
}

class FreelaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Boarding(),
      theme: ThemeData(
        fontFamily: 'Google',
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
      ),
    );
  }
}
