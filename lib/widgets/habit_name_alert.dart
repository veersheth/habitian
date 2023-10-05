import 'package:flutter/material.dart';

class HabitNameAlert extends StatelessWidget {
  final saveHabitName;
  const HabitNameAlert({super.key, this.saveHabitName});

  @override
  Widget build(BuildContext context) {
    TextEditingController habitNameController = TextEditingController();
    return AlertDialog(
        title: const Text("Add a new habit"),
        content: TextField(
          controller: habitNameController,
          decoration: const InputDecoration(
            labelText: "Habit Name",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              saveHabitName(habitNameController.text);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
  }
}