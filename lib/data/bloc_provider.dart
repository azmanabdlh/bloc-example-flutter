
import 'package:flutter/material.dart';
import 'package:todo_bloc_app/data/bloc/bloc_contract.dart';

class BlocProvider<T extends BlocContract> extends StatefulWidget {
  final Widget child;
  final T bloc;

  BlocProvider({Key key, @required this.bloc, @required this.child})
    : super(key: key);


  static T of<T extends BlocContract>(BuildContext context) {
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();

    return provider.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}


class _BlocProviderState extends State<BlocProvider> {


  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}