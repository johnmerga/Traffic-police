import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/help/help.dart';
import 'package:traffic_police/data/models/help.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/help_list/help_detail/Help_Detail_Officer.dart';
import 'package:traffic_police/screen_generator.dart';

class InputField extends StatefulWidget {
  final List<Help> helps;
  InputField({required this.helps});
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables

  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    TextStyle officerName = Theme.of(context).textTheme.subtitle2!;
    TextStyle helpLocation = Theme.of(context).textTheme.subtitle2!;

    return widget.helps.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(child: Text('No helps yet')))
        : ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.helps.length,
            itemBuilder: (BuildContext context, int index) {
              Help help = widget.helps[index];
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  minVerticalPadding: 15,
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Icon(Icons.help),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${help.description}",
                          style: officerName,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  subtitle: Text(
                    "${help.subcity}",
                    style: helpLocation,
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () {
                        debugPrint("Delete penalty");

                        BlocProvider.of<HelpBloc>(context)
                            .add(DeleteHelp(help: help));
                      }),
                  onTap: () {
                    debugPrint("Listen ontap");
                    Navigator.pushNamed(
                        context, RouteGenerator.myhelpdetailofficer,
                        arguments: HelpDetailOfficerArguments(
                            help: help, context: context));
                  },
                ),
              );
            });
  }
}
