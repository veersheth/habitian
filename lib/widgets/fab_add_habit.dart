import 'package:flutter/material.dart';
import 'package:habitian/widgets/habit_name_alert.dart';

class FABAddHabit extends StatelessWidget {
  final Function addHabit;
  const FABAddHabit({super.key, required this.addHabit});

  @override
  Widget build(BuildContext context) {
    Widget addHabitDialog() {
      return HabitNameAlert(
        saveHabitName: (habitName) {
          addHabit(habitName);
        }
      );
    }

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context, 
          builder: (context) => addHabitDialog(),
        );
      },
      child: const Icon(Icons.add),
    );
  }


}
