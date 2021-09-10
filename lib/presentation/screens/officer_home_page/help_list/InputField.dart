import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/screen_generator.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  int count = 7;
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
        itemBuilder: (BuildContext context, int position) {
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
              subtitle: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Accept",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                debugPrint("Listen ontap");
                Navigator.pushNamed(context, RouteGenerator.helpdetailofficer);
              },
            ),
          );
        });
  }
}
