import 'package:hive_flutter/hive_flutter.dart';

class TasksDatabase{
  List tasks = [];

  final _tasksDB = Hive.box('tdata');

  void firstLaunch(){
    tasks = [
      ['Tap the checkbox to mark as done', false],
      ['Swipe left to delete a task', false],
    ];
  }

  void loadData(){
    tasks = _tasksDB.get('TASKS');
  }

  void updateDB(){
    _tasksDB.put('TASKS', tasks);
  }

}