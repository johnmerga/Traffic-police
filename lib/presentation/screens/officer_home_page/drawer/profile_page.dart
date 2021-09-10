//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/authentication/auth_temp.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/widget/numbers_widget.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/drawer/widget/profile_widget.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';
import 'package:traffic_police/screen_generator.dart';

class OfficerProfilePage extends StatefulWidget {
  @override
  _OfficerProfilePageState createState() => _OfficerProfilePageState();
}

class _OfficerProfilePageState extends State<OfficerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthtempBloc, AuthtempState>(
      listener: (context, state) {},
      builder: (context, state) {
        String user = "", email = "", info = "";
        if (state is LoggedIn) {
          user = state.user.firstName + " " + state.user.lastName;
          email = state.user.email;
          info =
              "Started Date: ${state.user.startDate} \nAddress: ${state.user.state}";
        }

        return Builder(
          builder: (context) => Scaffold(
            appBar: usableAppbar(isHome: false, name: "Profile-Page"),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 24),
                ProfileWidget(
                  imagePath: 'assets/officer1.png',
                  onClicked: () {
                    Navigator.pushNamed(context, RouteGenerator.editprofile);
                  },
                ),
                const SizedBox(height: 24),
                buildName(user, email),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
                NumbersWidget(),
                const SizedBox(height: 48),
                buildAbout(user, info),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildName(String user, String email) => Column(
        children: [
          Text(
            user,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(user, info) => Container(
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
              info,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
