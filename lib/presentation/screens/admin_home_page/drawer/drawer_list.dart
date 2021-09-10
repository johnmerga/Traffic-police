import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/authentication/auth_temp.dart';
import 'package:traffic_police/screen_generator.dart';

Widget drawerLists({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, RouteGenerator.adminprofile);
          },
          leading: Icon(Icons.person),
          title: Text('Profile'),
        ),
        SizedBox(height: 10),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.settings),
          title: Text('setting'),
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}

//
Widget logout() {
  return BlocConsumer<AuthtempBloc, AuthtempState>(
    listener: (context, state) {},
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          onTap: () {
            BlocProvider.of<AuthtempBloc>(context).add(LogoutEvent());
            Navigator.pushNamedAndRemoveUntil(
                context, RouteGenerator.loginPage, (route) => false);
          },
          leading: Icon(
            Icons.logout,
            color: Colors.red,
          ),
          title: Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    },
  );
}




// Widget DrawerList() {
  
//   return Container(
//     padding: EdgeInsets.only(
//       top: 15,
//     ),
//     child: Column(
//       children: [
//         menuItems(),
//       ],
//     ),
//   );
// }

// Widget menuItems() {
//   return Material(
//     elevation: 1.0,
//     child: InkWell(
//       onTap: () {},
//       child: Padding(
//         padding: EdgeInsets.all(15),
//         child: Row(
//           children: [
//             Expanded(
//               child: Icon(
//                 Icons.settings,
//                 size: 20,
//                 color: Colors.black,
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Text(
//                 "Setting",
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
