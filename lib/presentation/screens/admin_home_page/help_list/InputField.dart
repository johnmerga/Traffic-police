import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/screen_generator.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  int count = 17;
  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    TextStyle officerName = Theme.of(context).textTheme.subtitle2!;
    TextStyle helpLocation = Theme.of(context).textTheme.subtitle2!;

    return ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, count) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              minVerticalPadding: 15,
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.help),
              ),
              title: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      "Officer Name",
                      style: officerName,
                    ),
                    Text(
                      "Location",
                      style: helpLocation,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              onTap: () {
                debugPrint("Listen ontap");
                Navigator.pushNamed(context, RouteGenerator.helpdetailadmin);
              },
            ),
          );
        });
  }
}
