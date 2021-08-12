//import 'dart:js';

import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project1/addOfficer.dart';
import 'package:project1/adminpage.dart';
import 'login.dart';
import 'officerpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    //LoginPage.tag: (context) => LoginPage(),
    //AdminPage.tag: (context) => AdminPage(),
    AddOfficer.tag: (context) => AddOfficer(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: OfficerPage(),
      routes: routes,
    );
  }
}
