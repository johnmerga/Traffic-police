import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/screen_generator.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables

  bool _isHidden = true;
  int count = 12;
  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    // clears input text

    TextStyle penaltyTitle = Theme.of(context).textTheme.subtitle1!;
    TextStyle penaltyName = Theme.of(context).textTheme.subtitle2!;
    TextStyle penaltyDate = Theme.of(context).textTheme.subtitle2!;

    return ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              minVerticalPadding: 10,
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.receipt),
              ),
              title: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Penalty Title",
                      style: penaltyTitle,
                    ),
                    Text(
                      "Officer Name",
                      style: penaltyName,
                    ),
                    Text(
                      "Officer Date",
                      style: penaltyDate,
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  onPressed: () {
                    debugPrint("Delete penalty");
                  }),
              onTap: () {
                debugPrint("Listen ontap");
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.penaltyDetailOfficer);
              },
            ),
          );
        });
  }
}
