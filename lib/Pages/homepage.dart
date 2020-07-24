import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';
import 'package:study_habits/Pages/taskcreator.dart';
import '../constants/my_icons_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<String> taskList = [
    'Read Attack on titan for class',
    'Start Designing TaskIt',
    'Study for systems midterm'
  ];


  List<bool> values = [];

  Task result;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < taskList.length;i++)
      {
        values.add(false);
      }
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
          size: 26,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          awaitReturnTaskFromCreator(context);
        },
      ),
      body: _buildList()
    );
  }



  Widget _buildList() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: taskList.length,
      itemBuilder: (context, key) { return new
        CheckboxListTile(
            title: Text(taskList[key], style: TextStyle(fontSize: 18.0)),
            value: values[key],
            onChanged: (bool newValue) {
            setState(() {
            values[key] = newValue;
            if (newValue)
              {
                taskList.removeAt(key);
                values.removeAt(key);
              }
            });
            }); //On changed

    });
  } //widget build list


  void awaitReturnTaskFromCreator(BuildContext context) async {

    // start taskcreator and wait for the task to be saved
    final Task resultGotten = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskCreatorPage(),
        ));

    // add to this list
    setState(() {
      taskList.add(resultGotten.title);
    });
  }



}






