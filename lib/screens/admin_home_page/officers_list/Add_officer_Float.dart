import 'package:flutter/material.dart';
import 'package:traffic_police/screens/screen_generator.dart';

class Add_Officer_Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, RouteGenerator.addOfficer);
        },
        tooltip: 'Add Officers',
        child: Icon(Icons.add),
      ),
    );
  }
}
