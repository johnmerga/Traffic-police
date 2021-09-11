import 'package:flutter/material.dart';
import 'package:traffic_police/screens/screen_generator.dart';

class HelpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "Ask Help",
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
