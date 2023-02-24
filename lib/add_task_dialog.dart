import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  late String newTask;
  final Function addTaskToList;

  AddTaskDialog(this.addTaskToList);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text('Add task', textAlign: TextAlign.center,),
      content: TextField(
        autofocus: true,
        textAlign: TextAlign.center,
        cursorColor: Color(0xFFF83558),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFA95A),),
          ),
          hintText: 'New Task',
        ),
        onChanged: (value){
          newTask = value;
        },
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Color(0x33FFA95A),),
            ),
            onPressed: (){
              addTaskToList(newTask);
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Color(0xFFF83558),
              ),
            ),
        )
      ],
    );
  }
}
