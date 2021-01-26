import 'package:dkatalis_assignment/screens/password_setup_screen.dart';
import 'package:dkatalis_assignment/screens/personal_info_screen.dart';
import 'package:dkatalis_assignment/screens/schedule_screen.dart';
import 'package:dkatalis_assignment/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        WelcomeScreen.routeName: (_) => WelcomeScreen(),
        PasswordSetupScreen.routeName: (_) => PasswordSetupScreen(),
        PersonalInfoScreen.routeName: (_) => PersonalInfoScreen(),
        ScheduleScreen.routeName: (_) => ScheduleScreen(),
      },
      initialRoute: ScheduleScreen.routeName,
    );
  }
}
