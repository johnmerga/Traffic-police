import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables
  final clearTxt = TextEditingController();
  bool _isHidden = true;
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

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

    return Form(
      key: _formKey,
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
                Text("Select Date Of Issue"),
                SizedBox(
                  width: 15,
                ),
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
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
            child: TextFormField(
              validator: (value) {},
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
              validator: (value) {},
              controller: clearTxt,
              decoration: InputDecoration(
                hintText: "Driver's First Name",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffix: IconButton(
                  onPressed: () => clearInput(),
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
            child: TextFormField(
              validator: (value) {},
              controller: clearTxt,
              decoration: InputDecoration(
                hintText: "Driver's Last Name",
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
            child: TextFormField(
              validator: (value) {},
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
            child: TextFormField(
              validator: (value) {},
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
              validator: (value) {},
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
              validator: (value) {},
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
      ),
    );
  }

  void validateform() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }
}
