import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traffic_police/data/models/help.dart';
import 'package:traffic_police/data/models/help_payload.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  final clrdescription = TextEditingController();
  final clrlocation = TextEditingController();
  final clrdate = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      var helpProvider = Provider.of<HelpPayload>(context, listen: false);
      Help help = helpProvider.help;
      helpProvider.updateHelp(help.copyWith(date: picked));
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    var helpProvider = Provider.of<HelpPayload>(context, listen: true);
    Help help = helpProvider.help;

    if (clrdescription.text.isEmpty) clrdescription.text = help.description;
    if (clrlocation.text.isEmpty) clrlocation.text = help.subcity;
    selectedDate = help.date;

    return Form(
      key: helpProvider.formKey,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: colorCustom1,
              ),
            )),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //  Text("Select Date "),
                //   SizedBox(width: 15),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Icon(Icons.calendar_today),
                ),
                SizedBox(width: 10),
                Text("${selectedDate.toLocal()}".split(' ')[0]),
              ],
            ),
          ),

          //Description input
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: colorCustom1,
              ),
            )),
            child: TextFormField(
              controller: clrdescription,
              validator: (value) {
                if (help.description.isEmpty) {
                  return 'Please enter description';
                }
                return null;
              },
              onChanged: (value) {
                helpProvider.updateHelp(help.copyWith(description: value));
              },
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearDescription(),
                //   icon: Icon(Icons.clear),
                // ),
              ),
            ),
          ),

          // Location

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: colorCustom1,
              ),
            )),
            child: TextFormField(
              controller: clrlocation,
              onChanged: (value) {
                helpProvider.updateHelp(help.copyWith(subcity: value));
              },
              validator: (value) {
                if (help.subcity.isEmpty) {
                  return 'Please enter location';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Location",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearLocation(),
                //   icon: Icon(Icons.clear),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
