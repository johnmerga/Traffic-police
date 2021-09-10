import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/help/help.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/add_help/ask_help.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/help_list/Add_Help_Float.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';
import 'package:traffic_police/screen_generator.dart';

import 'Header.dart';
import 'InputWrapper.dart';

class HelpListOfficer extends StatefulWidget {
  @override
  State<HelpListOfficer> createState() => _HelpListOfficerState();
}

class _HelpListOfficerState extends State<HelpListOfficer> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocProvider<HelpBloc>(
      create: (context) => HelpBloc()..add(FetchHelp()),
      child: Builder(
          builder: (buildContext) => Scaffold(
                appBar: usableAppbar(isHome: false, name: "Asked Helps"),

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
                          child: BlocBuilder<HelpBloc, HelpState>(
                            builder: (context, state) {
                              if (state is HelpListLoadedState) {
                                return InputWrapper(
                                  helps: state.helps,
                                );
                              }
                              if (state is HelpErrorState) {
                                Future.delayed(
                                    Duration(seconds: 2),
                                    () => ScaffoldMessenger.of(buildContext)
                                            .showSnackBar(SnackBar(
                                          content: Text("${state.message}"),
                                        )));
                                return Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.replay_outlined,
                                      size: 40,
                                    ),
                                    onPressed: () =>
                                        BlocProvider.of<HelpBloc>(buildContext)
                                            .add(FetchHelp()),
                                  ),
                                );
                              }
                              return Center(
                                child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      // Add_Help_Float(onTap: () {
                      //   Navigator.pushNamed(
                      //       buildContext, RouteGenerator.addhelp,
                      //       arguments: AskHelpArguments(context: buildContext));
                      // }),
                    ],
                  ),
                ),
              )),
    );
  }
}
