import 'package:flutter/material.dart';
import 'InputField.dart';

class InputWrapper extends StatelessWidget {
  final GlobalKey<InputFieldState> formKey = GlobalKey<InputFieldState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 5),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputField(),
          ),
          SizedBox(
            height: 40,
          ),

          // (state is AuthenticationLoading) ?

          // SizedBox(
          //   height: 3,
          // )
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.red[100]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
