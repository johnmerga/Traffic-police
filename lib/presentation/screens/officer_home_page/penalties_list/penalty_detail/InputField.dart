import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  final clrtitle = TextEditingController();
  final clrdescription = TextEditingController();
  final clrfname = TextEditingController();
  final clrlname = TextEditingController();
  final clrlicencenumber = TextEditingController();
  final clrplatenumber = TextEditingController();
  final clrsubcity = TextEditingController();
  final clramount = TextEditingController();

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
    void clearTitle() {
      clrtitle.clear();
    }

    void clearDescription() {
      clrdescription.clear();
    }

    void clearFname() {
      clrfname.clear();
    }

    void clearLname() {
      clrlname.clear();
    }

    void clearLicence() {
      clrlicencenumber.clear();
    }

    void clearPlate() {
      clrplatenumber.clear();
    }

    void clearSubcity() {
      clrsubcity.clear();
    }

    void clearAmount() {
      clramount.clear();
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
            controller: clrtitle,
            decoration: InputDecoration(
              hintText: "Title",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearTitle(),
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

        // Driver's first name input

        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clrfname,
            decoration: InputDecoration(
              hintText: "Driver's First Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearFname(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Driver's last name input

        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clrlname,
            decoration: InputDecoration(
              hintText: "Driver's Last Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearLname(),
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
            controller: clrlicencenumber,
            decoration: InputDecoration(
              hintText: "Licence Number",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearLicence(),
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
            controller: clrplatenumber,
            decoration: InputDecoration(
              hintText: "Plate Number",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearPlate(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),

        // Sub city input

        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: colorCustom1,
            ),
          )),
          child: TextField(
            controller: clrsubcity,
            decoration: InputDecoration(
              hintText: "Driver's Full Name",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearSubcity(),
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
            controller: clramount,
            decoration: InputDecoration(
              hintText: "Penalty amount in ETB",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              suffix: IconButton(
                onPressed: () => clearAmount(),
                icon: Icon(Icons.clear),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
