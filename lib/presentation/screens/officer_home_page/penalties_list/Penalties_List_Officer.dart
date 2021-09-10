import 'package:flutter/material.dart';
import 'package:traffic_police/blocs/penalty/penalty.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/add_penalities/add_penalties.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/screen_generator.dart';

import 'Add_penalty_Float.dart';
import 'Header.dart';
import 'InputWrapper.dart';

class PenaltyListOfficer extends StatefulWidget {
  @override
  State<PenaltyListOfficer> createState() => _PenaltyListOfficerState();
}

class _PenaltyListOfficerState extends State<PenaltyListOfficer> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocProvider<PenaltyBloc>(
      create: (context) => PenaltyBloc()..add(FetchPenaltyByOfficer()),
      child: Builder(
          builder: (buildContext) => Scaffold(
                appBar: usableAppbar(isHome: false, name: "Penalties"),

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
                          child: BlocBuilder<PenaltyBloc, PenaltyState>(
                            builder: (context, state) {
                              if (state is PenaltyListLoadedState) {
                                return InputWrapper(
                                  penalties: state.panalties,
                                );
                              }
                              if (state is PenaltyErrorState) {
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
                                        BlocProvider.of<PenaltyBloc>(
                                                buildContext)
                                            .add(FetchPenaltyByOfficer()),
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
                      Add_Penalty_Float(onTap: () {
                        Navigator.pushNamed(
                            buildContext, RouteGenerator.addPenalties,
                            arguments:
                                AddPenaltiesArguments(context: buildContext));
                      }),
                    ],
                  ),
                ),
              )),
    );
  }
}
