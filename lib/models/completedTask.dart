import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:study_habits/pages/taskcreator.dart';

class Completed with ChangeNotifier {
  List<String> tasks;

  // void removeTask(Task task) {
  //   tasks.remove(task.title);
  // }

  void addTask(Task task) {
    tasks.add(task.title);

    notifyListeners();
  }

  void clearCompleted() {
    tasks = [];
    notifyListeners();
  }
}
