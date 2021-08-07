//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = "login-page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        //child: Image.asset('images/logo.jpg'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //border: OutLineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //border: OutLineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        onPressed: () {
          //Navigator.of(context).pushNamed(HomePage.tag);
        },
        child: Text('Log In',
            style: TextStyle(color: Colors.white, fontSize: 17.0)),
      ),
    );

    final forgotLabel = TextButton(
      child: Text(
        'Do not have account? Signup',
        style: TextStyle(color: Colors.purple, fontSize: 15),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 50.0),
              email,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgotLabel
            ]),
      ),
    );
  }
}
