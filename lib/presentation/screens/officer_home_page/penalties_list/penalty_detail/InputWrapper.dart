import 'package:flutter/material.dart';

import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 50, top: 60),
        child: InputField());
  }
}
