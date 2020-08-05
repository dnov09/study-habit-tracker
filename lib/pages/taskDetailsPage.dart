import 'package:flutter/material.dart';
import 'package:study_habits/pages/completedTaskPage.dart';
import 'package:study_habits/constants/style.dart';
import 'package:study_habits/pages/taskcreator.dart';
import 'package:study_habits/widgets/appBar.dart';
import '../constants/my_icons_icons.dart';
import '../models/completedTask.dart';

class TaskDetails extends StatefulWidget {
  final Task taskGotten;
  TaskDetails({Key key, @required this.taskGotten}) : super(key: key);

  @override
  TaskDetailsState createState() => TaskDetailsState();
}

class TaskDetailsState extends State<TaskDetails> {
  // Effort effort;
  List<int> efforts = [];
  // CompletedPage finished;
  var duration = 0;
  final timeCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    timeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(), body: effortView());
  }

  Widget effortView() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.taskGotten.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Description: \n\n',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),
                TextSpan(
                    text: widget.taskGotten.description,
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
              ],
            ),
          ),
          Divider(),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Due Date: \n\n',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),
                TextSpan(
                    text: widget.taskGotten.deadLine.toString(),
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
              ],
            ),
          ),
          Divider(),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Total time spent: ',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                ),
                TextSpan(
                  text: '$duration minutes',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Efforts Logged: ',
            style: TextStyle(
              fontSize: 15,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: efforts.length,
            itemBuilder: (context, idx) {
              var date = new DateTime.now().toString();
              var dateParse = DateTime.parse(date);
              var currentDate =
                  "${dateParse.month}/${dateParse.day}/${dateParse.year}";

              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$currentDate :',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 16)),
                  Text(
                    '${efforts[idx].toString()} minutes',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                    ),
                  )
                ],
              );
            },
          ),
          SizedBox(height: 24),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: timeCtrl,
              validator: (value) =>
                  (value.isEmpty) ? "Please enter value" : null,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'How much time did you spend working today?'),
            ),
          ),
          SizedBox(height: 16),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 48,
                width: 100,
                child: FlatButton(
                  color: Colors.blueGrey,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  // splashColor: Colors.blueAccent,
                  onPressed: () {
                    //create new task
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        duration += int.parse(timeCtrl.text);
                        efforts.add(int.parse(timeCtrl.text));
                        timeCtrl.clear();
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.save),
                      Text(
                        'Save',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                width: 160,
                child: FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  // splashColor: Colors.blueAccent,
                  onPressed: () {
                    //navigate to completed task but doesnt do anything
                    // finished.completedTasks.add(widget.taskGotten.title);
                    Navigator.popAndPushNamed(context, CompletedTaskPage.route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.check),
                      Text(
                        'Complete Task',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } //widget build list

}
