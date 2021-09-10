import 'package:flutter/material.dart';

import 'InputField.dart';

class InputWrapper extends StatefulWidget {
  InputWrapper();

  @override
  _InputWrapperState createState() => _InputWrapperState();
}

class _InputWrapperState extends State<InputWrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 60),
        child: InputField());
  }
}
