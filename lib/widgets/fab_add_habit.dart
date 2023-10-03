import 'package:flutter/material.dart';

class FABAddHabit extends StatelessWidget {
  final Function addHabit;
  const FABAddHabit({super.key, required this.addHabit});

  @override
  Widget build(BuildContext context) {
    Widget AddHabitDialog() {
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
              this.addHabit(habitNameController.text);
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      );
    }

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context, 
          builder: (context) => AddHabitDialog(),
        );
      },
      child: Icon(Icons.add),
    );
  }


}
