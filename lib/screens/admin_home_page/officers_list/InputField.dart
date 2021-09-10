import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/screens/screen_generator.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables

  final clearTxt = TextEditingController();
  bool _isHidden = true;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    // clears input text
    void clearInput() {
      clearTxt.clear();
    }

    TextStyle officerName = Theme.of(context).textTheme.subtitle1!;
    TextStyle officerTitle = Theme.of(context).textTheme.subtitle2!;

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.local_police),
              ),
              title: Text(
                "Officer Name",
                style: officerName,
              ),
              subtitle: Text("Position"),
              trailing: Icon(Icons.more_vert, color: Colors.blue),
              onTap: () {
                debugPrint("Listen ontap");
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.officerDetail);
              },
            ),
          );
        });
  }
}
