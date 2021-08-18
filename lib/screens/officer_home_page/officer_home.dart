import 'package:flutter/material.dart';
import 'package:traffic_police/screens/officer_home_page/drawer/main_drawer.dart';

class OfficerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Container(
          child: Text('data'),
        ),
      ),
    );
  }
}
