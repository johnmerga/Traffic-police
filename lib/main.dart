//import 'dart:js';

import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      
      home: LoginPage(),
      routes: routes,
    );
  }
}
