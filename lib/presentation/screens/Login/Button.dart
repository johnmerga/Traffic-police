import 'package:flutter/material.dart';

import 'package:traffic_police/presentation/screens/Login/InputField.dart';
import 'package:traffic_police/screen_generator.dart';

class Button extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {
          final GlobalKey<FormState> form = InputField.keyLogin;
          if (form.currentState?.validate()?? false) {
            form.currentState?.save();
            Navigator.pushReplacementNamed(context, RouteGenerator.officerHome);
          }
          // Navigator.of(context).pushNamed(RouteGenerator.officerHome);

          //Navigator.pushReplacementNamed(context, RouteGenerator.adminHome);
        },
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
