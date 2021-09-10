import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:traffic_police/blocs/penalty/penalty.dart';
import 'package:traffic_police/data/models/penality_payload.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';

import 'Add_Penalties_Button.dart';
import 'Header.dart';
import 'InputWrapper.dart';

class AddPenaltiesArguments {
  final BuildContext context;
  AddPenaltiesArguments({required this.context});
}

class AddPenalties extends StatefulWidget {
  @override
  State<AddPenalties> createState() => _AddPenaltiesState();
}

class _AddPenaltiesState extends State<AddPenalties> {
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocListener<PenaltyBloc, PenaltyState>(
      listener: (context, state) {
        if (state is PenaltyListLoadedState) {
          Navigator.of(context).pop();
        }
      },
      child: ChangeNotifierProvider(
        create: (context) => PenaltyPayload(),
        child: Scaffold(
          appBar: usableAppbar(isHome: false, name: "Add-Penalties"),

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
                Add_Penalties_Button(),
              ],
            ),
          ),
        ),
      ),
    );
    // return Scaffold(
    //   appBar: usableAppbar(isHome: false, name: "Add-Penalties"),

    //   //resizeToAvoidBottomInset: false,
    //   body: Container(
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topCenter,
    //         colors: [colorCustom1, colorCustom4],
    //       ),
    //     ),
    //     child: Column(
    //       children: <Widget>[
    //         if (!isKeyboard)
    //           SizedBox(
    //             height: 50,
    //           ),
    //         if (!isKeyboard) Header(),
    //         Expanded(
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(100),
    //                 topRight: Radius.circular(100),
    //               ),
    //             ),
    //             child: InputWrapper(),
    //           ),
    //         ),
    //         Add_Penalties_Button(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
