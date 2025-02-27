import 'package:flutter/material.dart';
import 'package:study_habits/pages/homepage.dart';
import 'package:study_habits/constants/style.dart';
import 'package:study_habits/widgets/appBar.dart';

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

  Effort(DateTime startTime, DateTime endTime, String description) {
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

  Task(String title, String description, DateTime deadline) {
    this.title = title;
    this.description = description;
    this.deadLine = deadline;
    this.efforts = [];
  }

  void addEffort(Effort effort) {
    this.efforts.add(effort);
  }
}

class _TaskCreatorPageState extends State<TaskCreatorPage> {
  final _formKey = GlobalKey<FormState>();
  //for getting input
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(), body: taskBody());
  }

  Widget taskBody() {
    return new Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              'Create New Task',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 40,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Form(
            key: _formKey,
            autovalidate: true,
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      validator: (value) {
                        value.isEmpty ? "Cannot leave field empty" : null;
                      },
                      controller: nameCtrl,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Enter task name",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      validator: (value) {
                        value.isEmpty ? "Cannot leave field empty" : null;
                      },
                      controller: descCtrl,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Enter task description",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: TextFormField(
                      validator: (value) {
                        value.isEmpty ? "Cannot leave field empty" : null;
                      },
                      controller: dateCtrl,
                      style: TextStyle(fontSize: 18),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.green, width: 2.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        contentPadding: EdgeInsets.only(left: 20),
                        labelText: "Deadline in how many days? ",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 48,
                      width: 160,
                      child: FlatButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        // splashColor: Colors.blueAccent,
                        onPressed: () {
                          //create new task
                          if (_formKey.currentState.validate()) {
                            Task newTask = new Task(
                                nameCtrl.text,
                                descCtrl.text,
                                DateTime.now().add(new Duration(
                                    days: int.parse(dateCtrl.text))));
                            sendSavedTask(context, newTask);
                            WidgetsBinding.instance
                                .addPostFrameCallback((_) => dateCtrl.clear());
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.save),
                            Text(
                              'Save Task',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Creating tasks using our widget
          // createTask("Enter Task Name", nameCtrl, false),
          // createTask("Enter Task Description", descCtrl, false),
          // createTask("Deadline in how many days?", dateCtrl, true),
        ],
      ),
    );
  }

  void sendSavedTask(BuildContext context, taskToSend) {
    Navigator.pop(context, taskToSend);
  }
}
