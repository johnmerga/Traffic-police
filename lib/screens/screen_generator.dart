import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_police/screens/Login/login.dart';
import 'package:traffic_police/screens/admin_home_page/add_officer/Add_Officer.dart';
import 'package:traffic_police/screens/officer_home_page/officer_home.dart';
import 'package:traffic_police/screens/admin_home_page/admin_home.dart';
import 'package:traffic_police/screens/officer_home_page/penalties_list/Penalties_List_Officer.dart';
import 'admin_home_page/officers_list/Officers_List.dart';
import 'admin_home_page/officers_list/officer_detail/Officer_Detail.dart';
import 'admin_home_page/penalties_list/Penalties_List_Admin.dart';
import 'admin_home_page/penalties_list/penalty_detail/Penalty_Detail_Admin.dart';
import 'officer_home_page/add_penalities/add_penalties.dart';
import 'officer_home_page/penalties_list/penalty_detail/Penalty_Detail_Officer.dart';

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
  static const String penaltyListAdmin =
      "/screens/admin_home_page/officers_list/penalty_List_Admin";
  static const String penaltyListOfficer =
      "/screens/officer_home_page/officers_list/penalty_List_Officer";

  static const String penaltyDetailAdmin =
      "/screens/admin_home_page/penalties_list/penalty_detail/penalty_detail_admin";
  static const String penaltyDetailOfficer =
      "/screens/officer_home_page/penalties_list/penalty_detail/penalty_detail_officer";

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
      case penaltyListAdmin:
        return MaterialPageRoute(builder: (_) => PenaltyListAdmin());
      case penaltyDetailAdmin:
        return MaterialPageRoute(builder: (_) => PenaltyDetailAdmin());
      case penaltyListOfficer:
        return MaterialPageRoute(builder: (_) => PenaltyListOfficer());

      case penaltyDetailOfficer:
        return MaterialPageRoute(builder: (_) => PenaltyDetailOfficer());

      default:
        throw FormatException("Route was not found");
    }
  }
}
