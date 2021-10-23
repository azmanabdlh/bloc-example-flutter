
import 'package:flutter/material.dart';
import 'package:todo_bloc_app/data/models/todo.dart';
import 'package:todo_bloc_app/pages/todo_completed_page.dart';

import 'package:todo_bloc_app/widgets/todo_item.dart';
import 'package:todo_bloc_app/data/bloc_provider.dart';
import 'package:todo_bloc_app/data/bloc/todo_bloc.dart';
import 'package:todo_bloc_app/data/bloc/todo_form_bloc.dart';

class TodoPage extends StatelessWidget {

  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('To-do App'),
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle, color: Colors.green[400]),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    final todosCompleted = BlocProvider.of<TodoBloc>(context).findAllCompleted();

                    return TodoCompletedPage(todosCompleted);
                  }
                )
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<String>(
                stream: BlocProvider.of<TodoFormBloc>(context).stream,
                initialData: '',
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  // nilai stream dari TextField [onChanged].
                  final text = snapshot.data;

                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _textFieldController,
                          onChanged: (String value) {
                            BlocProvider.of<TodoFormBloc>(context).onTextChange(value);
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Todo',
                            hintText: 'Apa yang kamu lakukan hari ini?'
                          ),
                        )
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        color: Colors.indigo,
                        splashRadius: 22.0,
                        onPressed: () {
                          BlocProvider.of<TodoBloc>(context).add(text);
                          _textFieldController.clear();
                        },
                      )
                    ],
                  );
                }
              ),
              SizedBox( height: 10),
              Divider(),
              SizedBox( height: 10),
              Text('My Todos', style: TextStyle(
                fontSize: 23.0, fontWeight: FontWeight.w700, color: Colors.black87
                )
              ),
              StreamBuilder<List<Todo>>(
                stream: BlocProvider.of<TodoBloc>(context).stream,
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                  final todos = snapshot.data;

                  if (todos == null || todos.isEmpty) {
                    return Text('Your todo empty.');
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: todos.length,
                    separatorBuilder: (BuildContext context, int index) => Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return TodoItem(todos[index], index);
                    }
                  );
                }
              )
            ],
          ),
        ),
    );
  }
}