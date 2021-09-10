import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';

class edit_Profile extends StatefulWidget {
  @override
  _edit_ProfileState createState() => _edit_ProfileState();
}

class _edit_ProfileState extends State<edit_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: usableAppbar(isHome: false, name: "Edit-Profile"),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: colorCustom1,
                            offset: Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/officer1.png"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            color: colorCustom1),
                        child: Icon(
                          Icons.open_in_browser,
                          color: colorCustom2,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
