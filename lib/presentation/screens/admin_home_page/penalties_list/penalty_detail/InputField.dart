import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    return ListView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Column(
          children: <Widget>[
            //Penalty titile
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Penalty Title",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Penalty date
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Penalty Date",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Penalty description
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Penalty Description",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // driver first name
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Driver First Name",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // driver last name
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Driver Last Name",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // licence number
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Licence Number",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // plate number
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Plate Number",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // subcity
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Penalty Subcity",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // Penalty amount
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              )),
              child: Text(
                "Penalty Amount in ETB",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
