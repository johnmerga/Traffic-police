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
      //children: [
      //Column(
      children: <Widget>[
        // Firsst Name input
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
              hintText: "First Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Last name input
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
              hintText: "Last Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Birth date input
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
              Text("Birth Date"),
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

        //Position input
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
              hintText: "Position",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Sex input
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
              hintText: "Sex",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // State input
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
              hintText: "State",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Phone number
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
              hintText: "Phone Number",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Email input

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
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearInput(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // password input
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: colorCustom1,
              ),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
                icon: Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            obscureText: _isHidden,
          ),
        ),

        // Start date input
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
              Text("Starting Date"),
              TextButton(
                onPressed: () => _selectDate(context),
                child: Icon(Icons.calendar_today),
              ),
              SizedBox(width: 10),
              Text("${selectedDate.toLocal()}".split(' ')[0]),
            ],
          ),
        ),
      ],
      //),
      //],
    );
  }
}
