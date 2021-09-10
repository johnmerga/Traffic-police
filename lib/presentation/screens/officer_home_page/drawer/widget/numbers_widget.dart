import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/auth_temp/bloc/auth_temp.dart';
import 'package:traffic_police/auth_temp/bloc/authtemp_bloc.dart';
import 'package:traffic_police/main.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthtempBloc, AuthtempState>(
        listener: (context, state) {},
        builder: (context, state) {
          String position = "" ;
          if (state is LoggedIn) {
            position = state.user.position;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButton(context, "Position", position),
              buildDivider(),
              buildButton(context, '35', 'Penalties'),
              buildDivider(),
              buildButton(context, '50', 'Reports'),
            ],
          );
        },
      );
  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold,color: colorCustom4),
            ),
          ],
        ),
      );
}
