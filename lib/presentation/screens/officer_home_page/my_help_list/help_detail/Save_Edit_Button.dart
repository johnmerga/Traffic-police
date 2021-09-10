import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:traffic_police/blocs/help/help.dart';
import 'package:traffic_police/data/models/help_payload.dart';

class Save_Edit_Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var helpProvider = Provider.of<HelpPayload>(context, listen: true);
    var help = helpProvider.help;
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {
          var formKey = helpProvider.formKey;
          if (formKey.currentState?.validate() ?? false) {
            BlocProvider.of<HelpBloc>(context).add(UpdateHelp(help: help));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter all required fields')),
            );
          }
        },
        child: Text(
          "Save",
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
