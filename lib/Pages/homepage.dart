import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';
import 'package:study_habits/Pages/taskcreator.dart';
import 'package:study_habits/widgets/appBar.dart';
import 'package:study_habits/Pages/effortPage.dart';
import '../constants/my_icons_icons.dart';

class HomePage extends StatefulWidget {
  static String route = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //default starting list

  List<Task> taskList = [
    new Task("Start designing TaskIt", "Working on some code",
        DateTime.now().add(new Duration(days: 3)))
  ];

  //checklist values, when true the items disappear from list
  List<bool> values = [];

  //task send from task creator
  Task result;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < taskList.length; i++) {
      values.add(false);
    }
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          MyIcons.add,
          size: 26,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          awaitReturnTaskFromCreator(context);
        },
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: taskList.length,
        itemBuilder: (context, key) {
          return new GestureDetector(
              child: CheckboxListTile(
                title:
                    Text(taskList[key].title, style: TextStyle(fontSize: 18.0)),
                value: values[key],
                onChanged: (bool newValue) {
                  setState(
                    () {
                      values[key] = newValue;
                      if (newValue) {
                        // taskList.removeAt(key);
                        // values.removeAt(key);
                      }
                    },
                  );
                },
              ),
              onLongPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EffortPage(taskList[key])));
              }); //On changed
        });
  }

  void awaitReturnTaskFromCreator(BuildContext context) async {
    // start taskcreator and wait for the task to be saved
    final Task resultGotten = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskCreatorPage(),
        ));

    // add to this list
    setState(() {
      if (!(resultGotten == null)) {
        taskList.add(resultGotten);
      }
    });
  }
}
