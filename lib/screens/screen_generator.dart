import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_police/screens/Login/login.dart';
import 'package:traffic_police/screens/officer_home_page/officer_home.dart';



class RouteGenerator {
  static const String loginPage = "/";
  static const String officerHome = "/screens/officer_home_page/officer_home";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case officerHome:
        return MaterialPageRoute(builder: (_) => OfficerHome());
      default:
        throw FormatException("Route was not found");
    }
  }
}
