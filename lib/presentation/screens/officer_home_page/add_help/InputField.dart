import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  final clrdescription = TextEditingController();
  final clrlocation = TextEditingController();
  bool _isHidden = true;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    // clears input text
    void clearDescription() {
      clrdescription.clear();
    }

    void clearLocation() {
      clrlocation.clear();
    }

    return Column(
      children: <Widget>[
        // Date input
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: Row(
            children: <Widget>[
              Text("Select Date"),
              SizedBox(width: 25),
              TextButton(
                onPressed: () => _selectDate(context),
                child: Icon(Icons.calendar_today),
              ),
              SizedBox(width: 10),
              Text("${selectedDate.toLocal()}".split(' ')[0]),
            ],
          ),
        ),

        // Help description input
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clrdescription,
            decoration: InputDecoration(
              hintText: "Description",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearDescription(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Location
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clrlocation,
            decoration: InputDecoration(
              hintText: "Location",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearLocation(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
