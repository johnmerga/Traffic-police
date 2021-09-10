import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traffic_police/blocs/penalty/penalty.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/data/models/penality_payload.dart';

class Add_Penalties_Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var penaltyProvider = Provider.of<PenaltyPayload>(context, listen: true);
    var penalty = penaltyProvider.penalty;
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {
          var formKey = penaltyProvider.formKey;
          if (formKey.currentState?.validate() ?? false) {
            BlocProvider.of<PenaltyBloc>(context)
                .add(CreatePenalty(penalty: penalty));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter all required fields')),
            );
          }
        },
        child: Text(
          "Add Penalty",
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
