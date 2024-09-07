import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  final _myBox = Hive.box('todoBox');

  void createInitialData() {
    todoList = [
      ["Make tutorial", false],
      ["Buy groceries", false],
      ["Cook dinner", false],
    ];
  }

  void loadData() {
    todoList = _myBox.get('todoList', defaultValue: todoList);
  }

  void updateDatabase() {
    _myBox.put('todoList', todoList);
  }
}
