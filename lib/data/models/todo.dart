
class Todo {

  Todo({this.text,  this.completed});

  final String text;
  bool completed;

  bool get isCompleted => this.completed;

  void toggleCompleted() {
    this.completed = !this.completed;
  }
}