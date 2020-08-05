import 'package:flutter/material.dart';
import 'package:study_habits/models/completedTask.dart';
import 'package:study_habits/Pages/completedTaskPage.dart';
import 'package:study_habits/constants/my_icons_icons.dart';

class MyAppBar extends PreferredSize {
  final double elevation;

  MyAppBar({this.elevation});
  Size get preferredSize => Size.fromHeight(80);

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.center,
      child: AppBar(
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
            onPressed: () {
              Navigator.pushNamed(context, CompletedTaskPage.route);
            },
          )
        ],
      ),
    );
  }
}
