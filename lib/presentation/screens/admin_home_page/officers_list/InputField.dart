import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/screen_generator.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables

  final clearTxt = TextEditingController();
  bool _isHidden = true;
  int count = 9;
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
        physics: ClampingScrollPhysics(),
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
              trailing: PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
              onTap: () {
                debugPrint("Listen ontap");
                Navigator.pushNamed(context, RouteGenerator.officerDetail);
              },
            ),
          );
        });
  }
}

class Constants {
  static const String Delete = 'Delete Officer';
  static const String Ban = 'Ban Officer';
  static const String MakeAdmin = 'Make Admin';

  static const List<String> choices = <String>[Delete, Ban, MakeAdmin];
}

void choiceAction(String choice) {
  if (choice == Constants.Delete) {
    print('Delete');
  } else if (choice == Constants.Ban) {
    print('Ban');
  } else if (choice == Constants.MakeAdmin) {
    print('MakeAdmin');
  }
}
