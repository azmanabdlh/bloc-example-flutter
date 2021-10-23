
import 'dart:async';

import 'package:todo_bloc_app/data/bloc/bloc_contract.dart';
import 'package:todo_bloc_app/data/models/todo.dart';
import 'package:todo_bloc_app/data/repositories/todo_repository_contract.dart';

class TodoBloc implements BlocContract {
  final _controller = StreamController<List<Todo>>();
  TodoRepositoryContract _repository;

  Stream<List<Todo>> get stream => _controller.stream;

  TodoBloc({ TodoRepositoryContract repository })
    : this._repository = repository;


  List<Todo> findAllCompleted() {
    return _repository.findCompleted();
  }

  void add(String value) {
    _repository.add(value);

    // perbaharui masukan todo dengan yang baru.
    _controller.sink.add(_repository.all());
  }

  void toggleCompleted(int index) {
    _repository.toggle(index);

    _controller.sink.add(_repository.all());
  }

  @override
  void dispose() {
    // ! hancurkan stream controller ini untuk menjaga dari kebocoran memori.
    _controller.close();
  }
}