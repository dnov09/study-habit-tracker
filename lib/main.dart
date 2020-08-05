import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_habits/pages/completedTaskPage.dart';
import 'package:study_habits/pages/loginPage.dart';
import 'package:study_habits/pages/signupPage.dart';

import 'models/completedTask.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Completed())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        initialRoute: '/login',
        routes: {
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/sign-up': (context) => SignUpPage(),
          '/completed': (context) => CompletedTaskPage()
          // '/completed': (context) => CompletedPage()
        },
      ),
    );
  }
}
