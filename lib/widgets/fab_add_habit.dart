import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/habit_name_alert.dart';

class FABAddHabit extends StatelessWidget {
  final Function addHabit;
  const FABAddHabit({super.key, required this.addHabit});

  @override
  Widget build(BuildContext context) {
    Widget AddHabitDialog() {
      return HabitNameAlert(
        saveHabitName: (habitName) {
          this.addHabit(habitName);
        }
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
