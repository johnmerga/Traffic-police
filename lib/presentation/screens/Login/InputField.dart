import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  static final GlobalKey<FormState> keyLogin =  GlobalKey();
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  // validator
  // String validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return "* Required";
  //   } else if (value.length < 6) {
  //     return "Password should be atleast 6 characters";
  //   } else if (value.length > 15) {
  //     return "Password should not be greater than 15 characters";
  //   } else
  //     return null;
  // }

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    // clears input text
    void clearInput() {
      _emailController.clear();
    }

    return Form(
      key: InputField.keyLogin,
      child: Column(
        children: <Widget>[
          // Email input

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: colorCustom1,
              ),
            )),
            child: TextFormField(
              controller: _emailController,
              onChanged: (value) => _email = value.trim(),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => !isEmail(value.toString())
                  ? "Sorry, we do not recognize this email address"
                  : null,
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffix: IconButton(
                  onPressed: () => clearInput(),
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),

          // password input

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              ),
            ),
            child: TextFormField(
              controller: _passwordController,
              onChanged: (value) => _password = value.trim(),
              validator: (value) => value != null && value.length < 8
                  ? "Password must be 8 or more characters in length"
                  : null,
              onSaved: (value) => _password = value.toString(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      _isHidden = !_isHidden;
                    });
                  },
                  icon:
                      Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              obscureText: _isHidden,
            ),
          ),
        ],
      ),
    );
  }

  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(regex);

    return value.isNotEmpty && regExp.hasMatch(value);
  }
}
