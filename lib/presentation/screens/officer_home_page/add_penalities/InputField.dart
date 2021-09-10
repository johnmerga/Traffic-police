import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:traffic_police/data/models/penality_payload.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  InputField();
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables

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
    if (picked != null && picked != selectedDate) {
      var penaltyProvider = Provider.of<PenaltyPayload>(context, listen: false);
      Penalty penalty = penaltyProvider.penalty;
      penaltyProvider.updatePenalty(penalty.copyWith(dateOfIssue: picked));
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var penaltyProvider = Provider.of<PenaltyPayload>(context, listen: true);
    Penalty penalty = penaltyProvider.penalty;
    if (clrdescription.text.isEmpty) clrdescription.text = penalty.description;
    if (clrfname.text.isEmpty) clrfname.text = penalty.victimName;
    if (clrlname.text.isEmpty) clrlname.text = penalty.victimLastName;
    if (clrlicencenumber.text.isEmpty)
      clrlicencenumber.text = penalty.license_number;
    if (clrplatenumber.text.isEmpty) clrplatenumber.text = penalty.plate_number;
    if (clrsubcity.text.isEmpty) clrsubcity.text = penalty.subcity;
    if (clramount.text.isEmpty)
      clramount.text = penalty.penalty_in_birr.toString();
    selectedDate = penalty.dateOfIssue;
    // toggle obscureText

    return Form(
      key: penaltyProvider.formKey,
      child: ListView(
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
              onChanged: (value) {
                penaltyProvider
                    .updatePenalty(penalty.copyWith(description: value));
              },
              validator: (value) {
                if (penalty.description.isEmpty) {
                  return 'Please enter description';
                }
                return null;
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

          // Driver's first name input

          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: colorCustom1,
              ),
            )),
            child: TextFormField(
              controller: clrfname,
              onChanged: (value) {
                penaltyProvider
                    .updatePenalty(penalty.copyWith(victimName: value));
              },
              validator: (value) {
                if (penalty.victimName.isEmpty) {
                  return 'Please enter first name';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Driver's First Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearFname(),
                //   icon: Icon(Icons.clear),
                // ),
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
            child: TextFormField(
              controller: clrlname,
              onChanged: (value) {
                penaltyProvider
                    .updatePenalty(penalty.copyWith(victimLastName: value));
              },
              validator: (value) {
                if (penalty.victimLastName.isEmpty) {
                  return 'Please enter last name';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Driver's Last Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearLname(),
                //   icon: Icon(Icons.clear),
                // ),
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
            child: TextFormField(
              controller: clrlicencenumber,
              onChanged: (value) {
                penaltyProvider
                    .updatePenalty(penalty.copyWith(license_number: value));
              },
              validator: (value) {
                if (penalty.license_number.isEmpty) {
                  return 'Please enter license number';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Licence Number",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearLicence(),
                //   icon: Icon(Icons.clear),
                // ),
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
            child: TextFormField(
              controller: clrplatenumber,
              onChanged: (value) {
                penaltyProvider
                    .updatePenalty(penalty.copyWith(plate_number: value));
              },
              validator: (value) {
                if (penalty.plate_number.isEmpty) {
                  return 'Please enter plate number';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Plate Number",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearPlate(),
                //   icon: Icon(Icons.clear),
                // ),
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
            child: TextFormField(
              controller: clrsubcity,
              onChanged: (value) {
                penaltyProvider.updatePenalty(penalty.copyWith(subcity: value));
              },
              validator: (value) {
                if (penalty.subcity.isEmpty) {
                  return 'Please enter sub city';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Sub City",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearSubcity(),
                //   icon: Icon(Icons.clear),
                // ),
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
            child: TextFormField(
              controller: clramount,
              onChanged: (value) {
                penaltyProvider.updatePenalty(
                    penalty.copyWith(penalty_in_birr: int.parse(value)));
              },
              validator: (value) {
                if (penalty.penalty_in_birr <= 0) {
                  return 'Please enter valid amount ';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Penalty amount in ETB",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                // suffix: IconButton(
                //   onPressed: () => clearAmount(),
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
