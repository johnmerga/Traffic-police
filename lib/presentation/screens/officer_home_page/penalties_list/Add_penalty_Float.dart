import 'package:flutter/material.dart';
import 'package:traffic_police/screen_generator.dart';


class Add_Penalty_Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteGenerator.addPenalties);
      },
      tooltip: 'Add Officers',
      child: Icon(Icons.add),
    );
  }
}
