import 'package:flutter/material.dart';
import 'package:study_habits/constants/style.dart';
import 'package:study_habits/Pages/taskcreator.dart';
import '../constants/my_icons_icons.dart';


class EffortPage extends StatefulWidget {

  Task taskGotten;
  EffortPage(this.taskGotten);

  @override
  EffortPageState createState() => EffortPageState(this.taskGotten);


}




class EffortPageState extends State<EffortPage> {

  Task taskGotten;
  EffortPageState(this.taskGotten);


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

        body: effortView());
  }


  Widget effortView() {
    return new Align(
      alignment: Alignment.center,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: taskGotten.efforts.length,
        itemBuilder: (context, key) {
          return new ListTile(
            title: Text(taskGotten.efforts[key].description, style: TextStyle(fontSize: 16.0))
          );
        }




      )



    );
  } //widget build list





}


