import 'package:flutter/material.dart';
import 'package:study_habits/Pages/completedTaskPage.dart';
import 'package:study_habits/Pages/loginPage.dart';
import 'package:study_habits/Pages/signupPage.dart';

import 'Pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/sign-up': (context) => SignUpPage(),
        '/completed': (context) => CompletedTaskPage()
      },
    );
  }
}
