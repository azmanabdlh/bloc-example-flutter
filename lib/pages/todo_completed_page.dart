

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_bloc_app/data/bloc/todo_bloc.dart';
import 'package:todo_bloc_app/data/bloc_provider.dart';
import 'package:todo_bloc_app/data/models/todo.dart';
import 'package:todo_bloc_app/widgets/todo_item.dart';

class TodoCompletedPage extends StatelessWidget {

  final List<Todo> todos;

  TodoCompletedPage(this.todos, {Key key})
    : super(key: key);

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('To-do Completed'),
      ),
      body: todos.isEmpty
        ? Center(
            child: Text('Todo completed is empty.')
          )
        : Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.separated(
              itemCount: todos.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (_, int index) {
                return TodoItem(todos[index], index);
              },
          ),
      )
    );
  }
}