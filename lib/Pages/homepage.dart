import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';

import '../constants/my_icons_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _taskComplete = false;

  List<String> tasks = [
    'Read Attack on titan for class',
    'Start Designing TaskIt',
    'Study for systems midterm'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2.0,
        title: const Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Task',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  )),
              TextSpan(
                text: 'It',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MyIcons.calendar_check,
              // size: 32,
            ),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          MyIcons.add,
          size: 24,
        ),
        backgroundColor: Colors.cyan,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 16.0, bottom: 16),
              child: Text(
                'Today',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.cyan,
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var task in tasks) {},
                IconButton(
                    icon: (_taskComplete)
                        ? Icon(MyIcons.ok_squared)
                        : Icon(MyIcons.check_empty),
                    onPressed: () {
                      setState(() {
                        _taskComplete = !_taskComplete;
                      });
                    }),
                Text(
                  'Read attack on titan',
                  style: MyStyle.taskText.copyWith(
                    fontSize: 15,
                    decoration:
                        (_taskComplete) ? TextDecoration.lineThrough : null,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
