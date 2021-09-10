import 'package:flutter/material.dart';
import 'package:traffic_police/screens/drawer/drawer_header.dart';
import 'package:traffic_police/screens/drawer/drawer_list.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Drawer_header(),
              drawerLists(),
            ],
          ),
          logout(),
        ],
      ),
    );
  }
}
