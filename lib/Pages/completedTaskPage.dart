import 'package:flutter/material.dart';
import 'package:study_habits/widgets/appBar.dart';
import 'package:study_habits/constants/my_icons_icons.dart';
import 'package:study_habits/constants/style.dart';

class CompletedTaskPage extends StatefulWidget {
  static String route = '/completed';
  List<String> complete = ["Finish CS 487 final paper", "Task 123", "Task 345"];

  CompletedTaskPage({Key key, this.complete}) : super(key: key);
  @override
  _CompletedTaskPageState createState() => _CompletedTaskPageState();
}

class _CompletedTaskPageState extends State<CompletedTaskPage> {
  List<String> completedTasks = [
    "Finish CS 487 final paper",
    "Task 123",
    "Task 345"
  ];
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: completedBody(),
    );
  }

  Widget completedBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 16.0, bottom: 16),
          child: Text(
            'Completed Tasks',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.cyan,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: completedTasks.length,
          itemBuilder: (context, idx) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: CheckboxListTile(
                value: checked,
                title: Text(
                  completedTasks[idx],
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough, fontSize: 18),
                ),
                onChanged: null,
              ),
            );
          },
        ),
      ],
    );
  }
}
