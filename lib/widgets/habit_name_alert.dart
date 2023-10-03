import 'package:flutter/material.dart';

class HabitNameAlert extends StatelessWidget {
  final saveHabitName;
  const HabitNameAlert({super.key, this.saveHabitName});

  @override
  Widget build(BuildContext context) {
    TextEditingController habitNameController = TextEditingController();
    return AlertDialog(
        title: Text("Add a new habit"),
        content: TextField(
          controller: habitNameController,
          decoration: InputDecoration(
            labelText: "Habit Name",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              this.saveHabitName(habitNameController.text);
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      );
  }
}