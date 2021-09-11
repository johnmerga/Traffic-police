import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/widget/use_again.dart';

import 'Add_penalty_Float.dart';
import 'Header.dart';
import 'InputWrapper.dart';

class PenaltyList extends StatefulWidget {
  @override
  State<PenaltyList> createState() => _PenaltyListState();
}

class _PenaltyListState extends State<PenaltyList> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: usableAppbar(isHome: false, name: "Penalties", context: context),

      //resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [colorCustom1, colorCustom4],
          ),
        ),
        child: Column(
          children: <Widget>[
            if (!isKeyboard)
              SizedBox(
                height: 20,
              ),
            if (!isKeyboard) Header(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
                child: InputWrapper(),
              ),
            ),
            Add_Penalty_Float(),
          ],
        ),
      ),
    );
  }
}
