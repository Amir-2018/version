import 'dart:developer';

import 'package:flutter/material.dart';
import 'features/authentication/presentation/widgets/changepassword.dart';
import 'features/authentication/presentation/widgets/home/Mode.dart';
import 'features/authentication/presentation/widgets/home/home.dart';
import 'features/authentication/presentation/widgets/login/login.dart';
import 'features/authentication/presentation/widgets/profile_info.dart';
import 'features/authentication/presentation/widgets/signup/signup.dart';
import 'features/authentication/presentation/widgets/subwidgets/button_navigation_bar.dart';
import 'features/authentication/presentation/widgets/update_profile.dart';
import 'features/authentication/presentation/widgets/verifyEmail.dart';
https://github.com/matiasdev30/flutter_map_draw_route/tree/main/flutter_map_draw_route
void main() {
  runApp(
    MaterialApp(
      title: 'Chotrana smart village',
      debugShowCheckedModeBanner: false,
      // Define routes
      initialRoute: '/mode',
      routes: {
        '/update_profile': (context) => UpdteProfile(),
        '/signup': (context) => SignupWidget(),
        '/verifyEmail': (context) =>  VerifyEmail(),
        '/changePassword': (context) => const ChangePasswordWidget(),
        /*'/verifyCode': (context) => const VerifyCode(),*/
        '/login': (context) => LoginWidget(),
        '/home': (context) => Home(),
        '/mode' :  (context) => Mode(),
        '/profileinfo': (context) => ProfileInfo(),
        '/simpleBottomNavigation': (context) => ButtonNavigationBar(),


      },
    ),
  );
}
