import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/authentication/auth_temp.dart';
import 'package:traffic_police/main.dart';

class Drawer_header extends StatefulWidget {
  @override
  _Drawer_headerState createState() => _Drawer_headerState();
}

class _Drawer_headerState extends State<Drawer_header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorCustom1,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      child: BlocConsumer<AuthtempBloc, AuthtempState>(
        listener: (context, state) {},
        builder: (context, state) {
          String name = "name";
          String level = "level";
          if (state is LoggedIn) {
            name = state.user.firstName + " " + state.user.lastName;
            level = state.user.position;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: BoxDecoration(
                  color: colorCustom3,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/officer1.png'),
                  ),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                level,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 14,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
