import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_police/screens/Login/login.dart';
import 'package:traffic_police/screens/admin_home_page/add_officer/Add_Officer.dart';
import 'package:traffic_police/screens/officer_home_page/officer_home.dart';
import 'package:traffic_police/screens/admin_home_page/admin_home.dart';

import 'admin_home_page/officers_list/Officers_List.dart';
import 'admin_home_page/officers_list/officer_detail/Officer_Detail.dart';
import 'officer_home_page/add_penalities/add_penalties.dart';

class RouteGenerator {
  static const String loginPage = "/";
  static const String officerHome = "/screens/officer_home_page/officer_home";
  static const String adminHome = "/screens/admin_home_page/admin_home";
  static const String addOfficer =
      "/screens/admin_home_page/add_officer/add_officer";
  static const String addPenalties =
      "/screens/officer_home_page/add_penalities/add_penalties";
  static const String officerList =
      "/screens/admin_home_page/officers_list/Officers_List";
  static const String officerDetail =
      "/screens/admin_home_page/officers_list/Officer_detail/Officer_detail";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case officerHome:
        return MaterialPageRoute(builder: (_) => OfficerHome());
      case adminHome:
        return MaterialPageRoute(builder: (_) => AdminHome());
      case addOfficer:
        return MaterialPageRoute(builder: (_) => AddOfficer());
      case addPenalties:
        return MaterialPageRoute(builder: (_) => AddPenalties());
      case officerList:
        return MaterialPageRoute(builder: (_) => OfficerList());
      case officerDetail:
        return MaterialPageRoute(builder: (_) => OfficerDetail());

      default:
        throw FormatException("Route was not found");
    }
  }
}
