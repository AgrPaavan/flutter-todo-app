import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:todo_app/components/dialog_box.dart";
import "package:todo_app/components/my_button.dart";
import "package:todo_app/components/todo_tile.dart";
import "package:todo_app/data/database.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('todoBox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_myBox.get("todoList") == null) {
      db.createInitialData();
      _myBox.put("todoList", db.todoList);
    } else {
      db.loadData();
    }

    super.initState();
  }

  final TextEditingController _newTaskNameController = TextEditingController();

  /// Updates the state of the checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value!;
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_newTaskNameController.text, false]);
      _newTaskNameController.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.yellow,
          title: const Text("Delete Task"),
          content: const Text("Are you sure you want to delete this task?"),
          actions: [
            MyButton(
              onPressed: () => Navigator.of(context).pop(),
              text: "Cancel",
            ),
            MyButton(
              onPressed: () {
                setState(() {
                  db.todoList.removeAt(index);
                  db.updateDatabase();
                });
                Navigator.of(context).pop();
              },
              text: "Delete",
            ),
          ],
        );
      },
    );
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
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
