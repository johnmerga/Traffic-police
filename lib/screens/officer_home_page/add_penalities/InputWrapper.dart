import 'package:flutter/material.dart';

import 'Add_Penalties_Button.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 5),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: InputField(),
            ),
            SizedBox(
              height: 20,
            ),
            Add_Penalties_Button(),
          ],
        ),
      ),
    );
  }
}
