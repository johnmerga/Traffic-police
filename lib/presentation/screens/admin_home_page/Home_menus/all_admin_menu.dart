import 'package:flutter/material.dart';
import 'package:traffic_police/main.dart';
import 'package:traffic_police/presentation/widget/use_again.dart';
import 'package:traffic_police/screen_generator.dart';

class All_admin_menu extends StatelessWidget {
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
                          'Status of the week',
                          style: TextStyle(color: Colors.white),
                        )
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
                        Navigator.pushNamed(
                            context, RouteGenerator.officerList);
                      },
                      child: homeBtnContainer(
                        btnNmae: 'Officers',
                        icon: Icon(
                          Icons.local_police,
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
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.penaltyListAdmin);
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
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.recentlistadmin);
                      },
                      child: homeBtnContainer(
                        btnNmae: 'Recent',
                        icon: Icon(
                          Icons.format_list_bulleted,
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
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.helplistadmin);
                      },
                      child: homeBtnContainer(
                        btnNmae: 'Help',
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
