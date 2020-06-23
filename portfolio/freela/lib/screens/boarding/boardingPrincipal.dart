import 'package:flutter/material.dart';
import 'package:freela/screens/boarding/boardingArrow.dart';
import 'package:freela/screens/boarding/boardingHeart.dart';
import 'package:freela/screens/boarding/boardingMoney.dart';
import 'package:freela/screens/boarding/boardingPhone.dart';
import 'package:freela/screens/boarding/boardingWorld.dart';
import 'package:freela/screens/signin/signin.dart';
import 'package:page_indicator/page_indicator.dart';

class BoardingPrincipal extends StatefulWidget {
  @override
  _BoardingPrincipalState createState() => _BoardingPrincipalState();
}

class _BoardingPrincipalState extends State<BoardingPrincipal> {
  PageController pageController = PageController();
  int page = 0;
  List<Widget> pages = [
    BoardingWorld(),
    BoardingMoney(),
    BoardingPhone(),
    BoardingArrow(),
    BoardingHeart(),
    SignIn(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageIndicatorContainer(
      length: pages.length,
      indicatorColor: Colors.grey,
      indicatorSelectorColor: Color.fromRGBO(147, 120, 255, 1),
      child: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            page = index;
          });
        },
        itemBuilder: (context, index) {
          return pages[page];
        },
      ),
    ));
  }
}
