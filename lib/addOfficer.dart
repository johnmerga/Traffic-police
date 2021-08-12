import 'package:flutter/material.dart';
import 'package:project1/adminpage.dart';

class AddOfficer extends StatefulWidget {
  static String tag = 'addOfficer-page';

  @override
  _AddOfficer createState() => _AddOfficer();
}

class _AddOfficer extends State<AddOfficer> {
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

    final name = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Full Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

    final appellation = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Appellation or Title',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );
    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

    // ignore: non_constant_identifier_names
    final AddOfficerBtn = Expanded(
        child: TextButton(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 5.0, top: 5.0),
              child: new Container(
                  alignment: Alignment.center,
                  width: 170.0,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      color: Color(0xFF76FF03),
                      borderRadius: new BorderRadius.circular(9.0)),
                  child: new Text("Add Officer",
                      style:
                          new TextStyle(fontSize: 20.0, color: Colors.white))),
            ),
            onPressed: () {}));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic App'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            children: <Widget>[
              logo,
              SizedBox(height: 20.0),
              name,
              SizedBox(height: 15.0),
              appellation,
              SizedBox(height: 15.0),
              username,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 15.0),
              AddOfficerBtn,
            ]),
      ),
    );
  }
}
