//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/drawer/model/user.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/drawer/utils/user_preferences.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/drawer/widget/profile_widget.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';
import 'package:traffic_police/screen_generator.dart';

class AdminProfilePage extends StatefulWidget {
  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Builder(
      builder: (context) => Scaffold(
        appBar: usableAppbar(isHome: false, name: "Profile-Page"),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.pushNamed(context, RouteGenerator.editprofile);
              },
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 48),
            buildAbout(user),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
