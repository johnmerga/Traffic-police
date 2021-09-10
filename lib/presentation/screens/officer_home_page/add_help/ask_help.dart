import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:traffic_police/blocs/help/help.dart';
import 'package:traffic_police/data/models/help.dart';
import 'package:traffic_police/data/models/help_payload.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/add_help/Help_Button.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';

import 'Header.dart';
import 'InputWrapper.dart';

class AskHelpArguments {
  final BuildContext context;
  AskHelpArguments({required this.context});
}

class AddHelp extends StatefulWidget {
  AddHelp();
  @override
  State<AddHelp> createState() => _AddHelpState();
}

class _AddHelpState extends State<AddHelp> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocListener<HelpBloc, HelpState>(
      listener: (context, state) {
        if (state is HelpListLoadedState) {
          Navigator.of(context).pop();
        }
      },
      child: ChangeNotifierProvider(
        create: (context) => HelpPayload(),
        child: Scaffold(
          appBar: usableAppbar(isHome: false, name: "Ask Help"),

          //resizeToAvoidBottomInset: false,
          body: Container(
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
                    height: 20,
                  ),
                if (!isKeyboard) Header(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                    child: InputWrapper(),
                  ),
                ),
                HelpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
