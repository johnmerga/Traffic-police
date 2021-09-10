import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';


import '../../../../screen_generator.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables

  final clearTxt = TextEditingController();
  bool _isHidden = true;
  int count = 2;
  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    // clears input text
    void clearInput() {
      clearTxt.clear();
    }

    TextStyle penaltyTitle = Theme.of(context).textTheme.subtitle1!;
    TextStyle penaltyName = Theme.of(context).textTheme.subtitle2!;

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
                "Penalty Title",
                style: penaltyName,
              ),
              subtitle: Text(
                "Officer Name",
                style: penaltyTitle,
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
                Navigator.pushNamed(context, RouteGenerator.penaltyDetailAdmin);
              },
            ),
          );
        });
  }
}
