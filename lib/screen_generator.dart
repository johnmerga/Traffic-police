import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_police/presentation/screens/Login/login.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/add_officer/Add_Officer.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/admin_home.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/drawer/profile_page.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/help_list/Help_List_Admin.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/help_list/help_detail/Help_Detail_Admin.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/officers_list/Officers_List.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/officers_list/officer_detail/Officer_Detail.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/penalties_list/Penalties_List_Admin.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/penalties_list/penalty_detail/Penalty_Detail_Admin.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/recent/Recent_List_Admin.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/add_help/ask_help.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/add_penalities/add_penalties.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/edit_profile_page.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/profile_page.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/help_list/Help_List_Officer.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/help_list/help_detail/Help_Detail_Officer.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/officer_home.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/penalties_list/Penalties_List_Officer.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/penalties_list/penalty_detail/Penalty_Detail_Officer.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/recent/Recent_List_Officer.dart';

class RouteGenerator {
  static const String loginPage = "/";
  static const String officerHome =
      "/presentation/presentation/screens/officer_home_page/officer_home";
  static const String adminHome =
      "/presentation/screens/admin_home_page/admin_home";
  static const String addOfficer =
      "/presentation/screens/admin_home_page/add_officer/add_officer";
  static const String addPenalties =
      "/presentation/screens/officer_home_page/add_penalities/add_penalties";
  static const String officerList =
      "/presentation/screens/admin_home_page/officers_list/Officers_List";
  static const String officerDetail =
      "/presentation/screens/admin_home_page/officers_list/Officer_detail/Officer_detail";
  static const String penaltyListAdmin =
      "/presentation/screens/admin_home_page/officers_list/penalty_List_Admin";
  static const String penaltyListOfficer =
      "/presentation/screens/officer_home_page/officers_list/penalty_List_Officer";

  static const String penaltyDetailAdmin =
      "/presentation/screens/admin_home_page/penalties_list/penalty_detail/penalty_detail_admin";
  static const String penaltyDetailOfficer =
      "/presentation/screens/officer_home_page/penalties_list/penalty_detail/penalty_detail_officer";
  static const String help =
      "/presentation/screens/officer_home_page/help_list/Help_List";
  static const String helplistadmin =
      "/presentation/screens/admin_home_page/help_list/Help_List_Admin";

  static const String addhelp =
      "/presentation/screens/officer_home_page/add_help/ask_help";
  static const String helpdetailofficer =
      "/presentation/screens/officer_home_page/help_list/help_detail/Help_Dtail_Officer";
  static const String helpdetailadmin =
      "/presentation/screens/admin_home_page/help_list/help_detail/Help_Dtail_Admin";

  static const String recent =
      "/presentation/screens/officer_home_page/recent/recent_list_officer";
  static const String recentlistadmin =
      "/presentation/screens/admin_home_page/recent/Recent_List_Admin";

  static const String profile =
      "/presentation/screens/officer_home_page/drawer/profile_page";
  static const String adminprofile =
      "/presentation/screens/admin_home_page/drawer/profile_page";
  static const String editprofile =
      "/presentation/screens/officer_home_page/drawer/edit_profile_page";

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
      case help:
        return MaterialPageRoute(builder: (_) => HelpListOfficer());
      case addhelp:
        return MaterialPageRoute(builder: (_) => AddHelp());
      case helpdetailofficer:
        return MaterialPageRoute(builder: (_) => HelpDetailOfficer());
      case helplistadmin:
        return MaterialPageRoute(builder: (_) => HelpListAdmin());

      case helpdetailadmin:
        return MaterialPageRoute(builder: (_) => HelpDetailAdmin());

      case recent:
        return MaterialPageRoute(builder: (_) => RecentListOfficer());
      case recentlistadmin:
        return MaterialPageRoute(builder: (_) => RecentListAdmin());

      case profile:
        return MaterialPageRoute(builder: (_) => OfficerProfilePage());
      case adminprofile:
        return MaterialPageRoute(builder: (_) => AdminProfilePage());
      case editprofile:
        return MaterialPageRoute(builder: (_) => EditProfilePage());

      default:
        throw FormatException("Route was not found");
    }
  }
}
