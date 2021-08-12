import 'package:flutter/material.dart';
import 'package:project1/addOfficer.dart';
import 'package:project1/penalties.dart';

import 'acc_reports.dart';
import 'officers.dart';

class AdminPage extends StatefulWidget {
  static String tag = 'admin-page';

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
              height: 180.0,
              width: 180.0,
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
                    "Add Officer",
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
            return new AddOfficer();
          }));
        },
      ),
      TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
          child: new Container(
            padding: EdgeInsets.only(bottom: 10),
            height: 180.0,
            width: 180.0,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.local_police,
                  color: Color(0xFF039BE5),
                  size: 80.0,
                ),
                SizedBox(
                  height: 20,
                ),
                new Text(
                  "Officers",
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
            return Officers();
          }));
        },
      ),
    ]);

    final row2 =
        new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
          child: new Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 180.0,
              width: 180.0,
              child: Column(
                children: [
                  Icon(
                    Icons.notes,
                    color: Color(0xFFE040FB),
                    size: 80.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new Text(
                    "Penalties",
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
            return new Penalties();
          }));
        },
      ),
      TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
          child: new Container(
            padding: EdgeInsets.only(bottom: 10),
            height: 180.0,
            width: 180.0,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.car_repair,
                  color: Color(0xFFFF9100),
                  size: 80.0,
                ),
                SizedBox(
                  height: 20,
                ),
                new Text(
                  "Accident Reports",
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
            return new Acc_Reports();
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
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            children: <Widget>[
              logo,
              SizedBox(height: 30.0),
              row1,
              SizedBox(height: 20.0),
              row2,
            ]),
      ),
    );
  }
}
