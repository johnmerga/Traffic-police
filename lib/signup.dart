import 'package:flutter/material.dart';
import 'package:project1/login.dart';

class Signup extends StatefulWidget {
  static String tag = 'signup-page';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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

    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //(borderRadius: BorderRadius.circular(32.0)),
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

    final confirmPassword = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //border: OutLineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final SignUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(LoginPage.tag);
        },
        child: Text('Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 17.0)),
      ),
    );

    final forgotLabel = TextButton(
      child: Text(
        'Already have an account? Click here',
        style: TextStyle(color: Colors.purple, fontSize: 15),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (contect) {
          return new LoginPage();
        }));
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic App'),
      ),
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
              username,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 24.0),
              confirmPassword,
              SizedBox(height: 15.0),
              SignUpButton,
              forgotLabel
            ]),
      ),
    );
  }
}
