import 'package:flutter/material.dart';
import 'package:tasks/tasks_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();

  var box = await Hive.openBox('tdata');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xFFFFA95A),
      ),
      home: TasksScreen(),
    );
  }
}
