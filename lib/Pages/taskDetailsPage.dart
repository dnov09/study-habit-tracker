import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';
import 'package:study_habits/Pages/taskcreator.dart';
import 'package:study_habits/widgets/appBar.dart';
import '../constants/my_icons_icons.dart';

class TaskDetails extends StatefulWidget {
  final Task taskGotten;
  TaskDetails({Key key, @required this.taskGotten}) : super(key: key);

  @override
  TaskDetailsState createState() => TaskDetailsState();
}

class TaskDetailsState extends State<TaskDetails> {
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
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Due Date: \n',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),
                TextSpan(
                    text: widget.taskGotten.deadLine.toString(),
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 16)),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 8),
          Text.rich(
            TextSpan(
                text: 'Efforts Logged:',
                style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),
          ),
          SizedBox(height: 16),
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
        ],
      ),
    );
  } //widget build list

}
