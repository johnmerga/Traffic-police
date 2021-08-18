import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_police/screens/screen_generator.dart';

main() => runApp(Base());

class Base extends StatelessWidget {
  // const Base({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: colorCustom1,
        accentColor: colorCustom4,

        // text theme
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
MaterialColor colorCustom1 = MaterialColor(0xFF0A0E21, color);
MaterialColor colorCustom2 = MaterialColor(0xFFdc5034, color);
MaterialColor colorCustom3 = MaterialColor(0xFFc2ff00, color);
MaterialColor colorCustom4 = MaterialColor(0xFF00a1f1, color);
MaterialColor colorCustom5 = MaterialColor(0xFF095280, color);
// MaterialColor colorCustomWhite = MaterialColor(0x#FFffffff, color);
