import 'package:flutter/material.dart';
import 'package:study_habits/widgets/appBar.dart';
import 'package:study_habits/constants/my_icons_icons.dart';
import 'package:study_habits/constants/style.dart';

class CompletedTaskPage extends StatefulWidget {
  static String route = '/completed';
  @override
  _CompletedTaskPageState createState() => _CompletedTaskPageState();
}

class _CompletedTaskPageState extends State<CompletedTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
    );
  }

  Widget completedBody() {}
}
