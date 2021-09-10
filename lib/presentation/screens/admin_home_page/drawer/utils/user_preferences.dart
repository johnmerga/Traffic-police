import 'package:flutter/material.dart';
import 'package:traffic_police/presentation/screens/admin_home_page/drawer/model/user.dart';

class UserPreferences {
  static const myUser = User(
    imagePath: 'assets/officer1.png',
    name: 'Full Name',
    email: 'useremail.@gmail.com',
    username: 'username',
    password: 'password',
    about:
        'Certified Traffic Officer with years of experience in the field and training others on achieving their goals of becomming a Traffic Officer in a smooth way.',
  );
}
