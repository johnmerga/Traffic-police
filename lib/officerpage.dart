import 'package:flutter/material.dart';
import 'package:project1/add_penalty.dart';

import 'add_acc_report.dart';

class OfficerPage extends StatefulWidget {
  static String tag = 'officer-page';

  @override
  _OfficerPageState createState() => _OfficerPageState();
}

class _OfficerPageState extends State<OfficerPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Positioned(
      top: 2,
      left: 10,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(
          "assets/logo2.jpg",
        ),
        backgroundColor: Colors.transparent,
      ),
    );

    final row1 =
        new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
          child: new Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 200.0,
              width: 200.0,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.add_circle,
                    color: Color(0xFF76FF03),
                    size: 80.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new Text(
                    "Add Penalty",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  )
                ],
              )),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (contect) {
            return new Add_Penalty();
          }));
        },
      ),
      TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
          child: new Container(
            padding: EdgeInsets.only(bottom: 10),
            height: 200.0,
            width: 200.0,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.car_repair,
                  color: Color(0xFF039BE5),
                  size: 80.0,
                ),
                SizedBox(
                  height: 20,
                ),
                new Text(
                  "Add Accident Report",
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (contect) {
            return Acc_Report();
          }));
        },
      ),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic App'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
            children: <Widget>[
              logo,
              SizedBox(height: 30.0),
              row1,
            ]),
      ),
    );
  }
}
