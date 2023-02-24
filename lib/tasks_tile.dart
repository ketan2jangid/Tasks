import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget{
  String task;
  bool checked;
  void Function(bool?)? onPressed;
  Function(BuildContext)? deleteTask;

  TaskTile({required this.task, this.checked = false, this.onPressed, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                icon: Icons.delete,
                backgroundColor: Color(0xFFF83558),
                borderRadius: BorderRadius.circular(15),
                onPressed: deleteTask,
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            // tileColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              // side: BorderSide(width: 5, color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(15),
              ),
            ),
            title: Text(
              task,
              style: TextStyle(
                decoration: checked ? TextDecoration.lineThrough : TextDecoration.none,
              ),
              overflow: TextOverflow.clip,
            ),
            leading: Checkbox(
              activeColor: Color(0xFFF83558),
              value: checked,
              onChanged: onPressed,
            ),
          ),
        ),
    );
  }
}