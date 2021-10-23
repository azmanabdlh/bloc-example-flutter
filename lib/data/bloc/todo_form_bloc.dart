import 'dart:async';

import 'package:todo_bloc_app/data/bloc/bloc_contract.dart';

class TodoFormBloc implements BlocContract {

  final _controller = StreamController<String>();

  Stream<String> get stream => _controller.stream;

  void onTextChange(String value) {
    _controller.sink.add(value);
  }

  @override
  void dispose() {
    _controller.close();
  }
}