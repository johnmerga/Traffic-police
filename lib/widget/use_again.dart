import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// usable AppBar
AppBar usableAppbar({
  String name = "home",
  bool isHome = false,
}) {
  final styl = TextStyle(
    color: Colors.white70,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    fontFamily: 'Raleway',
  );

  return AppBar(
    centerTitle: true,
    title: Text(
      name,
      style: styl,
    ),
  );
}

// container for home menu

Column homeBtnContainer({
  String btnNmae = 'example',
  Icon icon = const Icon(
    Icons.add,
    size: 55.0,
  ),
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // padding: EdgeInsets.only(top: 40.0),
              child: icon,
            ),
            SizedBox(height: 8),
            Container(
              // padding: EdgeInsets.only(top: 40.0),
              child: Text(
                btnNmae,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

//
