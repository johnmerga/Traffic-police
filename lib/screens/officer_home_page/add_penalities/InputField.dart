import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  final clearTxt = TextEditingController();
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
    void clearInput() {
      clearTxt.clear();
    }

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                onPressed: () => _selectDate(context),
                child: Icon(Icons.calendar_today),
              ),
              SizedBox(width: 10),
              Text("${selectedDate.toLocal()}".split(' ')[0]),
            ],
          ),
        ),

        //Title input
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clearTxt,
            decoration: InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
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
          child: TextField(
            controller: clearTxt,
            decoration: InputDecoration(
              hintText: "Description",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Driver's full name input

        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clearTxt,
            decoration: InputDecoration(
              hintText: "Driver's Full Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Licence Number input
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clearTxt,
            decoration: InputDecoration(
              hintText: "Licence Number",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Plate Number input
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clearTxt,
            decoration: InputDecoration(
              hintText: "Plate Number",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Penalty amount input
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clearTxt,
            decoration: InputDecoration(
              hintText: "Penalty amount in ETB",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
