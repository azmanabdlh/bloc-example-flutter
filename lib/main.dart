import 'package:flutter/material.dart';
import 'package:todo_bloc_app/data/bloc/todo_form_bloc.dart';

import 'package:todo_bloc_app/pages/todo_page.dart';
import 'package:todo_bloc_app/data/repositories/todo_localstorage_repository.dart';
import 'package:todo_bloc_app/data/bloc/todo_bloc.dart';
import 'package:todo_bloc_app/data/bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BlocProvider<TodoBloc>(
        bloc: TodoBloc(
          repository: TodoLocalStorageRepository(),
        ),
        child: BlocProvider<TodoFormBloc>(
          bloc: TodoFormBloc(),
          child: TodoPage()
        )
      )
    );
  }
}
