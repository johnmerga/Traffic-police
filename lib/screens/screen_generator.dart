import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_police/screens/Login/login.dart';
import 'package:traffic_police/screens/second_screen.dart';



class RouteGenerator {
  static const String homePage = "/";
  static const String randomPage = "/screens/second_screen";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case randomPage:
        return MaterialPageRoute(builder: (_) => AboutPage());
      default:
        throw FormatException("Route was not found");
    }
  }
}
