import "package:flutter/material.dart";
import "package:todo_app/components/my_button.dart";

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      title: const Text("Create a new task"),
      content: SizedBox(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("New Task"),
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(),
                // hintText: "Task name",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
