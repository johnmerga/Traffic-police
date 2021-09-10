import 'package:flutter/material.dart';

class Add_Help_Float extends StatelessWidget {
  final VoidCallback onTap;
  Add_Help_Float({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      tooltip: 'Add Help',
      child: Icon(Icons.add),
    );
  }
}
