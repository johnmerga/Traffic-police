import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';

class All_menu extends StatelessWidget {
// rounded rectangle shape
  RoundedRectangleBorder roundedShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  );
// container for home menu
  //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Card(
                    shadowColor: colorCustom1,
                    elevation: 20,
                    color: colorCustom1L,
                    shape: roundedShape,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Stats of the week',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            _penalitie(context);
                          },
                          child: Text(
                            'test',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    shadowColor: colorCustom1,
                    elevation: 20,
                    color: colorCustom1L,
                    shape: roundedShape,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: roundedShape,
                      ),
                      onPressed: () {
                        _penalitie(context);
                      },
                      child: homeBtnContainer(
                        btnNmae: 'Penalties',
                        icon: Icon(
                          Icons.receipt,
                          size: 45,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: colorCustom1,
                    elevation: 20,
                    color: colorCustom1L,
                    shape: roundedShape,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: roundedShape,
                      ),
                      onPressed: () {},
                      child: homeBtnContainer(
                        btnNmae: 'Report',
                        icon: Icon(
                          Icons.report_problem,
                          size: 45,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: colorCustom1,
                    elevation: 20,
                    color: colorCustom1L,
                    shape: roundedShape,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: roundedShape,
                      ),
                      onPressed: () {},
                      child: homeBtnContainer(
                        btnNmae: 'Help',
                        icon: Icon(
                          Icons.help,
                          size: 45,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: colorCustom1,
                    elevation: 20,
                    color: colorCustom1L,
                    shape: roundedShape,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: roundedShape,
                      ),
                      onPressed: () {},
                      child: homeBtnContainer(
                        btnNmae: 'Recent',
                        icon: Icon(
                          Icons.format_list_bulleted,
                          size: 45,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _penalitie(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height * .9,
          child: Column(
            children: [
              
            ],
          ),
        );
      });
}
