import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/model/user.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/utils/user_preferences.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/widget/button_widget.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/widget/profile_widget.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/widget/textfield_widget.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: usableAppbar(
                isHome: false, name: "Edit-Profile-Page"),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  label: 'Username',
                  text: user.username,
                  onChanged: (username) {},
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  label: 'Password',
                  text: user.password,
                  onChanged: (password) {},
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  label: 'About',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) {},
                ),
                const SizedBox(height: 10),
                Center(
                  child: ButtonWidget(
                    text: "Save",
                    onClicked: () async {},
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
