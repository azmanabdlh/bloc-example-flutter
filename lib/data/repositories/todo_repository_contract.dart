
import 'package:todo_bloc_app/data/models/todo.dart';

abstract class TodoRepositoryContract {
  void add(String value);

  void toggle(int index);

  List<Todo> findCompleted();

  List<Todo> all();
}