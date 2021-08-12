import 'package:flutter/material.dart';

class Add_Penalty extends StatefulWidget {
  static String tag = 'addPenalty-page';

  @override
  _Add_PenaltyState createState() => _Add_PenaltyState();
}

class _Add_PenaltyState extends State<Add_Penalty> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
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
    final logo = Positioned(
      top: 2,
      left: 10,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(
          "assets/logo2.jpg",
        ),
        backgroundColor: Colors.transparent,
      ),
    );

    final title = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Title',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );
    final driversName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Drivers Full Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

    final licenseNumber = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Licence Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

    final plateNumber = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Plate Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );

    final date = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextButton(
          onPressed: () => _selectDate(context),
          child: Text('Select date'),
        ),
        SizedBox(width: 10),
        Text("${selectedDate.toLocal()}".split(' ')[0]),
      ],
    );

    final amount = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Penalty A amount in ETB',
        contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      ),
    );
    // ignore: non_constant_identifier_names
    final AddPenaltyBtn = Expanded(
        child: TextButton(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 5.0, top: 5.0),
              child: new Container(
                  alignment: Alignment.center,
                  width: 170.0,
                  height: 40.0,
                  decoration: new BoxDecoration(
                      color: Color(0xFF76FF03),
                      borderRadius: new BorderRadius.circular(9.0)),
                  child: new Text("Done",
                      style:
                          new TextStyle(fontSize: 20.0, color: Colors.white))),
            ),
            onPressed: () {}));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic App'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            children: <Widget>[
              logo,
              SizedBox(height: 20.0),
              title,
              SizedBox(height: 15.0),
              driversName,
              SizedBox(height: 15.0),
              licenseNumber,
              SizedBox(height: 15.0),
              plateNumber,
              SizedBox(height: 15.0),
              date,
              SizedBox(height: 15.0),
              amount,
              SizedBox(height: 15.0),
              AddPenaltyBtn,
            ]),
      ),
    );
  }
}
