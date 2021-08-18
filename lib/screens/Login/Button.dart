import 'package:flutter/material.dart';
import 'package:traffic_police/screens/screen_generator.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.of(context).pushNamed(RouteGenerator.officerHome);
          Navigator.pushReplacementNamed(context, RouteGenerator.officerHome);
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
