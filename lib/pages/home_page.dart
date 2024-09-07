import "package:flutter/material.dart";
import "package:todo_app/components/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ["Make tutorial", false],
    ["Buy groceries", false],
    ["Cook dinner", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) {
              setState(() {
                todoList[index][1] = value!;
              });
            },
          );
        },
      ),
    );
  }
}
