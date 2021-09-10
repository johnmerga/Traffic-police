import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/drawer/main_drawer.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';

import 'Home_menus/all_admin_menu.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// copy

// end

    return Scaffold(
      drawer: MainDrawer(),
      appBar: usableAppbar(
        isHome: false,
        name: "Admin-Page",
      ),
      body: All_admin_menu(),
    );
  }
}
