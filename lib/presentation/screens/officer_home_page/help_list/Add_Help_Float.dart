import 'package:flutter/material.dart';
import 'package:traffic_police/screen_generator.dart';

class Add_Help_Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteGenerator.addhelp);
      },
      tooltip: 'Add Help',
      child: Icon(Icons.add),
    );
  }
}
