import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/login/login_bloc.dart';
import 'package:traffic_police/blocs/login/login_event.dart';

class Button extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  Button({required this.formKey});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            formKey.currentState?.save();
            BlocProvider.of<LoginBloc>(context).add(
              LoginInWithEmailButtonPressed(
                  email: "admin@gmail.com", password: "admin123"),
            );
            //Navigator.pushReplacementNamed(context, RouteGenerator.officerHome);
          }
        },
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
