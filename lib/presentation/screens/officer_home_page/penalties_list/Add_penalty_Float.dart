import 'package:flutter/material.dart';

class Add_Penalty_Float extends StatelessWidget {
  final VoidCallback onTap;
  Add_Penalty_Float({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      tooltip: 'Add Officers',
      child: Icon(Icons.add),
    );
  }
}
