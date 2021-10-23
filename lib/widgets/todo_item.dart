
import 'package:flutter/material.dart';
import 'package:todo_bloc_app/data/bloc/todo_bloc.dart';
import 'package:todo_bloc_app/data/bloc_provider.dart';

import 'package:todo_bloc_app/data/models/todo.dart';

class TodoItem extends StatelessWidget {

  final Todo todo;
  final int index;

  TodoItem(this.todo, this.index, {Key key})
    : super(key: key);




  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: todo.isCompleted
        ? Icon(Icons.check_circle, color: Colors.green[700])
        : Icon(Icons.check_circle_outline),
      title: Text(todo.text,
        style: TextStyle(color: todo.isCompleted ? Colors.green[700] : Colors.black )),
      onTap: () {
        BlocProvider.of<TodoBloc>(context).toggleCompleted(index);
      }
    );
  }
}