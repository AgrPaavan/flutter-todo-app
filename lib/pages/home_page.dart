import "package:flutter/material.dart";
import "package:todo_app/components/dialog_box.dart";
import "package:todo_app/components/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _newTaskNameController = TextEditingController();

  List todoList = [
    ["Make tutorial", false],
    ["Buy groceries", false],
    ["Cook dinner", false],
  ];

  /// Updates the state of the checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = value!;
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_newTaskNameController.text, false]);
      _newTaskNameController.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (conext) {
        return DialogBox(
          controller: _newTaskNameController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
