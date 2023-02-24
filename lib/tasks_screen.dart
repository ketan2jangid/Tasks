import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/add_task_dialog.dart';
import 'package:tasks/database.dart';
import 'package:tasks/tasks_tile.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var _taskDB = Hive.box('tdata');
  TasksDatabase db = TasksDatabase();

  @override
  void initState() {

    if(_taskDB.get('TASKS') == null) {
      db.firstLaunch();
    }else {
      db.loadData();
    }

    super.initState();
  }

  void AddNewTask(String newTask){
    setState(() {
      db.tasks.add([newTask, false]);
    });

    db.updateDB();
  }
  
  void deleteTask(int index){
    setState(() {
      db.tasks.removeAt(index);
    });

    db.updateDB();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            // Colors.lightBlue,
            // Colors.purple,
            Color(0xFFF83558),
            Color(0xFFFF635A),
            Color(0xFFFFA95A),
          ]
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFF83558),
        splashColor: Color(0xFFFF635A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        label: Text(
          'Add',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) => AddTaskDialog(AddNewTask),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Tasks',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15),
                itemCount: db.tasks.length,
                itemBuilder: (context, index){
                  return TaskTile(
                    task: db.tasks[index][0],
                    checked: db.tasks[index][1],
                    onPressed: (check){
                      setState(() {
                        db.tasks[index][1] = !db.tasks[index][1];
                        db.updateDB();
                      });
                    },
                    deleteTask: (context) => deleteTask(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

