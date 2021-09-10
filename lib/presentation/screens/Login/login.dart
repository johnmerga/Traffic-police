import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/auth_temp/bloc/authtemp_bloc.dart';
import 'package:traffic_police/auth_temp/bloc/authtemp_state.dart';
import 'package:traffic_police/blocs/authentication/authentication.dart';
import 'package:traffic_police/blocs/login/login.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/screen_generator.dart';

import 'Header.dart';
import 'InputWrapper.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    //
    void _showError(String error, context) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthtempBloc, AuthtempState>(
        listener: (context, state) {
          //
          if (state is LoginFailed) {
            _showError("Invalid Username or Password", context);
          }
          if (state is LoggedIn) {
            final Officer of = state.user;
            if (of.is_admin) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteGenerator.adminHome, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteGenerator.officerHome, (route) => false);
            }
            // BlocProvider.of<AuthenticationBloc>(context).add(AppLoaded());
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [colorCustom1, colorCustom4],
              ),
            ),
            child: Column(
              children: <Widget>[
                if (!isKeyboard)
                  SizedBox(
                    height: 80,
                  ),
                if (!isKeyboard) Header(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80),
                      ),
                    ),
                    child: InputWrapper(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
