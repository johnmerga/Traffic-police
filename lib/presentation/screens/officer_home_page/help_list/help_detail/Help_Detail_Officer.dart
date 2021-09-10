import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/help_list/help_detail/Save_Edit_Button.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';

import 'Header.dart';
import 'InputWrapper.dart';

class HelpDetailOfficer extends StatefulWidget {
  @override
  State<HelpDetailOfficer> createState() => _HelpDetailOfficerState();
}

class _HelpDetailOfficerState extends State<HelpDetailOfficer> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: usableAppbar(isHome: false, name: "Help-Detail"),

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
            Save_Edit_Button(),
          ],
        ),
      ),
    );
  }
}
