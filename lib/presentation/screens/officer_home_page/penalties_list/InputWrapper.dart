import 'package:flutter/material.dart';
import 'package:traffic_police/data/models/models.dart';

import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  final List<Penalty> penalties;
  InputWrapper({required this.penalties});
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
            child: InputField(
              penalties: penalties,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
