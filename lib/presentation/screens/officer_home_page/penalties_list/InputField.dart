import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/penalty/penalty.dart';
import 'package:traffic_police/data/models/models.dart';
import 'package:traffic_police/presentation/screens/officer_home_page/penalties_list/penalty_detail/Penalty_Detail_Officer.dart';
import 'package:traffic_police/screen_generator.dart';

class InputField extends StatefulWidget {
  final List<Penalty> penalties;
  InputField({required this.penalties});
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // variables

  final clearTxt = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    // clears input text
    void clearInput() {
      clearTxt.clear();
    }

    TextStyle penaltyTitle = Theme.of(context).textTheme.subtitle1!;
    TextStyle penaltyName = Theme.of(context).textTheme.subtitle2!;

    return widget.penalties.isEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(child: Text('No penalities yet')))
        : ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.penalties.length,
            itemBuilder: (BuildContext context, int index) {
              Penalty penalty = widget.penalties[index];
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Icon(Icons.receipt),
                  ),
                  title: Text(
                    "${penalty.description}",
                    style: penaltyName,
                  ),
                  subtitle: Text(
                    "${penalty.victimName} ${penalty.victimLastName}",
                    style: penaltyTitle,
                  ),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () {
                        debugPrint("Delete penalty");

                        BlocProvider.of<PenaltyBloc>(context)
                            .add(DeletePenalty(penalty: penalty));
                      }),
                  onTap: () {
                    debugPrint("Listen ontap");
                    Navigator.pushNamed(
                        context, RouteGenerator.penaltyDetailOfficer,
                        arguments: PenaltyDetailOfficerArguments(
                            penalty: penalty, context: context));
                  },
                ),
              );
            });
  }
}
