import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';

import '../constants/my_icons_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _taskComplete = false;
  bool _taskComplete2 = false;
  bool _taskComplete3 = false;

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
            Container(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: (_taskComplete2)
                          ? Icon(MyIcons.ok_squared)
                          : Icon(MyIcons.check_empty),
                      onPressed: () {
                        setState(() {
                          _taskComplete2 = !_taskComplete2;
                        });
                      }),
                  Text(
                    'Study for software engineering',
                    style: MyStyle.taskText.copyWith(
                      fontSize: 15,
                      decoration:
                          (_taskComplete2) ? TextDecoration.lineThrough : null,
                    ),
                  )
                ],
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: (_taskComplete3)
                        ? Icon(MyIcons.ok_squared)
                        : Icon(MyIcons.check_empty),
                    onPressed: () {
                      setState(() {
                        _taskComplete3 = !_taskComplete3;
                      });
                    }),
                Text(
                  'Start designing task up',
                  style: MyStyle.taskText.copyWith(
                    fontSize: 15,
                    decoration:
                        (_taskComplete3) ? TextDecoration.lineThrough : null,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget generateTask(String taskText) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            icon: (_taskComplete3)
                ? Icon(MyIcons.ok_squared)
                : Icon(MyIcons.check_empty),
            onPressed: () {
              setState(() {
                _taskComplete3 = !_taskComplete3;
              });
            }),
        Text(
          taskText,
          style: MyStyle.taskText.copyWith(
            fontSize: 15,
            decoration: (_taskComplete3) ? TextDecoration.lineThrough : null,
          ),
        )
      ],
    );
  }
}
