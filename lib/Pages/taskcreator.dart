import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';

import '../constants/my_icons_icons.dart';

class TaskCreatorPage extends StatefulWidget {
  @override
  _TaskCreatorPageState createState() => _TaskCreatorPageState();
}

class Effort {
  DateTime startTime;
  DateTime endTime;
  String description;
  Duration duration;

  //duration is calculated from our times

  Effort(DateTime startTime, DateTime endTime, String description)
  {
    this.startTime = startTime;
    this.endTime = endTime;
    this.description = description;
    this.duration = startTime.difference(endTime);
  }

}

class Task {

  String title;
  String description;
  DateTime deadLine;
  List<Effort> efforts;


  Task(String title, String description, DateTime deadline)
  {
    this.title = title;
    this.description = description;
    this.deadLine = deadline;
    this.efforts = [];
  }


  void addEffort(Effort effort)
  {
    this.efforts.add(effort);
  }

}

class _TaskCreatorPageState extends State<TaskCreatorPage> {

  //for getting input
  final TextEditingController nameCtrl= TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController dateCtrl = TextEditingController();

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
      body: taskBody()

      );

  }

  Widget createTask(String label, TextEditingController ctrl, bool numbersOnly)
  {
    return new TextFormField(
        controller: ctrl,
        style: TextStyle(
            fontSize: 18
        ),
        keyboardType: (numbersOnly ? TextInputType.number : TextInputType.text),
        decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green, width:2.0),
          borderRadius: BorderRadius.circular(20.0)
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 35),
        labelText: label,
        )
    );

  }

  Widget taskBody()
  {
    return new Align(
      alignment: Alignment.center,
      child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 1, left: 16.0, bottom: 0),
              child: Text(
                'Create New Task',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Colors.green,
                ),
              ),
            ),
            //Creating tasks using our widget
            createTask("Enter Task Name", nameCtrl, false),
            createTask("Enter Task Description", descCtrl, false),
            createTask("Deadline in how many days?", dateCtrl, true),
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                //create new task
                Task newTask = new Task(nameCtrl.text, descCtrl.text, DateTime.now().add(new Duration(days:int.parse(dateCtrl.text))));
                sendSavedTask(context, newTask);
              },
              child: Text(
                "Save Task",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ])
    );

  }

  void sendSavedTask(BuildContext context, taskToSend) {
    Navigator.pop(context, taskToSend);
  }


}