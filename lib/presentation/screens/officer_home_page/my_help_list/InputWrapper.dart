import 'package:flutter/material.dart';
import 'package:traffic_police/data/models/help.dart';

import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  final List<Help> helps;
  InputWrapper({required this.helps});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 30),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(helps: helps),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
