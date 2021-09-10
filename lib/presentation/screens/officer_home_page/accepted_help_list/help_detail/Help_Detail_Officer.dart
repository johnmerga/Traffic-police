import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:traffic_police/blocs/help/help.dart';
import 'package:traffic_police/data/models/help.dart';
import 'package:traffic_police/data/models/help_payload.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';

import 'Header.dart';
import 'InputWrapper.dart';

class HelpDetailOfficerArguments {
  Help help;
  BuildContext context;
  HelpDetailOfficerArguments({required this.help, required this.context});
}

class HelpDetailOfficer extends StatefulWidget {
  final Help help;
  HelpDetailOfficer({required this.help});
  @override
  State<HelpDetailOfficer> createState() => _HelpDetailOfficerState();
}

class _HelpDetailOfficerState extends State<HelpDetailOfficer> {
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
        create: (context) => HelpPayload()..updateHelp(widget.help),
        child: Scaffold(
          appBar: usableAppbar(isHome: false, name: "Help-Detail"),

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
                // Save_Edit_Button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
