import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/screens/officer_home_page/drawer/main_drawer.dart';
import 'package:traffic_police/widget/use_again.dart';

import 'Home_menus/all_menu.dart';

class OfficerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// copy

// end

    return Scaffold(
      drawer: MainDrawer(),
      appBar: usableAppbar(isHome: true, name: "Traffic-officer"),
      body: All_menu(),
    );
  }
}