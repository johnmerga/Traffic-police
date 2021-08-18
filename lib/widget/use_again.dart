// import 'package:flutter/material.dart';
// import 'package:traffic_police/main.dart';
// import 'package:traffic_police/screens/login.dart';

// // class txtInputDcorator {
// //   // String lableName;
// //   // String endInput;
// //   // txtInputDcorator(this.lableName, this.endInput);

// //   InputDecoration inputdecor(
// //       {String lableName: 'text', String endInput: 'clear'}) {
// //     InputDecoration inDecorator = InputDecoration();
// //     final textclear = TextEditingController();

// //     clearTextInput() {
// //       textclear.clear();
// //     }

// //     switch (endInput) {
// //       case "clear":
// //         {
// //           inDecorator = InputDecoration(
// //            suffixIcon: IconButton(
// //               onPressed: () {

// //               },
// //               icon: Icon(Icons.clear),
// //             ),
// //             labelText: lableName,
// //             enabledBorder: UnderlineInputBorder(
// //               borderSide: BorderSide(color: Colors.cyan),
// //             ),
// //             focusedBorder: UnderlineInputBorder(
// //               borderSide: BorderSide(color: Colors.cyan),
// //             ),
// //           );
// //         }

// //         break;
// //       case "delete":
// //         {
// //           inDecorator = InputDecoration(
// //             labelText: lableName,
// //             enabledBorder: UnderlineInputBorder(
// //               borderSide: BorderSide(color: Colors.cyan),
// //             ),
// //             focusedBorder: UnderlineInputBorder(
// //               borderSide: BorderSide(color: Colors.cyan),
// //             ),*
// //           );
// //         }
// //         break;
// //     }
// //     return inDecorator;
// //   }
// // }

// TextField txtField(BuildContext  context, {isPassword = false, String txt = "text"}) {
//   bool toogleIsOn = false;
//   final textclear = TextEditingController();
//   clearTextInput() {
//     textclear.clear();
//   }

//   return TextField(
//     controller: textclear,
//     decoration: InputDecoration(
//         label: Text(txt),
//         suffixIcon: IconButton(
//           onPressed: () {
//             clearTextInput();
//           },
//           icon: isPassword ? Icon(Icons.visibility) : Icon(Icons.clear),
//         )),
//   );
// }




// // class txtFld extends StatefulWidget {
// //   @override
// //   _txtFldState createState() => _txtFldState();
// // }

// // class _txtFldState extends State<txtFld> {
// //   bool _passwordVisible = false;
// //   final textClr = TextEditingController();
// //   clrTxtInput() {
// //     textClr.clear();
// //   }

  
  

// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     _passwordVisible = false;
// //   }

// //   var txtField = TextField();

//   // Widget buildTextField({String text: 'text', String passwrd: ''}) {
// //     switch (passwrd) {
// //       case '':
// //         {
// //           txtField = TextField(
// //             controller: textClr,
// //             decoration: InputDecoration(
// //               hintText: text,
// //               suffixIcon: IconButton(
// //                 onPressed: () {
// //                   clrTxtInput();
// //                 },
// //                 icon: Icon(Icons.clear),
// //               ),
// //             ),
// //           );
// //         }
// //         break;
// //       case 'password':
// //         {
// //           txtField = TextField(
// //             controller: textClr,
// //             decoration: InputDecoration(
// //               hintText: text,
// //               suffixIcon: IconButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _passwordVisible = !_passwordVisible;
// //                   });
// //                 },
// //                 icon: Icon(
// //                   _passwordVisible ? Icons.visibility : Icons.visibility_off,
// //                 ),
// //               ),
// //             ),
// //           );
// //         }
// //         break;
// //     }
// //     return txtField;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return buildTextField();
// //   }
// // }






// // Widget buildTextField({String text: 'text', String passwrd: ''}) {
// //   bool passwordVisible = false;
// //   final textClr = TextEditingController();
// //   clrTxtInput() {
// //     textClr.clear();
// //   }

// //   var txtField = TextField();
// //   switch (passwrd) {
// //     case '':
// //       {
// //         txtField = TextField(
// //           controller: textClr,
// //           decoration: InputDecoration(
// //             hintText: text,
// //             suffixIcon: IconButton(
// //               onPressed: () {
// //                 clrTxtInput();
// //               },
// //               icon: Icon(Icons.clear),
// //             ),
// //           ),
// //         );
// //       }
// //       break;
// //     case 'password':
// //       {
// //         txtField = TextField(
// //           controller: textClr,
// //           decoration: InputDecoration(
// //             hintText: text,
// //             suffixIcon: IconButton(
// //               onPressed: () {},
// //               icon: Icon(
// //                 _passwordVisible ? Icons.visibility : Icons.visibility_off,
// //               ),
// //             ),
// //           ),
// //         );
// //       }
// //       break;
// //   }

// //   return txtField;
// // }
