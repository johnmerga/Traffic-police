import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_police/main.dart';

Widget drawerLists() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
        ListTile(
          onTap: () {},
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
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ListTile(
      onTap: () {},
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
