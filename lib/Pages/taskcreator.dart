import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';

import '../constants/my_icons_icons.dart';

class TaskCreatorPage extends StatefulWidget {
  @override
  _TaskCreatorPageState createState() => _TaskCreatorPageState();
}

class Task {

  String title;
  String description;

  Task(String title, String description)
  {
    this.title = title;
    this.description = description;
  }
}

class _TaskCreatorPageState extends State<TaskCreatorPage> {

  final nameCtrl= TextEditingController();
  final descCtrl = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Padding(
        padding: const EdgeInsets.only(top: 24, left: 16.0, bottom: 16),
        child: Text(
          'Create New Task',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.green,
          ),
        ),
      ),
      TextFormField(
        controller: nameCtrl,
          style: TextStyle(
            fontSize: 18
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              labelText: 'Enter Task Name',
          )
      ),
       TextFormField(
         controller: descCtrl,
          style: TextStyle(
            fontSize: 18
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 60),
              labelText: 'Enter Task Description',
          )
      ),
    FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: () {
            },
            child: Text(
              "Save Task",
              style: TextStyle(fontSize: 20.0),
            ),
          )
    ]),

      ),

    );
  }

  Widget createTask()
  {
    return Row(

      children: [

        TextField(
          decoration: InputDecoration(
          border: InputBorder.none,
          hintText: ''
          ),
        )


      ],


    ); //Row
  }

}