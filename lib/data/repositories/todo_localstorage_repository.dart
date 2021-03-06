
import 'package:todo_bloc_app/data/models/todo.dart';
import 'package:todo_bloc_app/data/repositories/todo_repository_contract.dart';

class TodoLocalStorageRepository implements TodoRepositoryContract {
  List<Todo> todos = [];

  void add(String value) {
    todos.add(
      Todo(text: value, completed: false)
    );
  }

  List<Todo> findCompleted() {
    return todos.where((Todo todo) => todo.isCompleted).toList();
  }

  void toggle(int index) {
    todos[index].toggleCompleted();
  }

  List<Todo> all() {
    return todos;
  }
}