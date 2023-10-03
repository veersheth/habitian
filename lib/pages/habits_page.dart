import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/fab_add_habit.dart';
import '../widgets/habit_tile.dart';

class Habits_Page extends StatefulWidget {
  const Habits_Page({super.key});

  @override
  State<Habits_Page> createState() => _Habits_PageState();
}

List todaysHabits = [
  ["Read", false ],
  ["Meditate", false ],
  ["Strength", false ],
  ["Cardio", false ],
  ["Journal", false ],
];

class _Habits_PageState extends State<Habits_Page> {

  void toggleHabitStatus(context, index) {
    setState(() {
      todaysHabits[index][1] = !todaysHabits[index][1];
    });
  }

  void addHabit(String newHabitName) {
    setState(() {
      todaysHabits.add([newHabitName, false]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Habits"),
      ),
      floatingActionButton: FABAddHabit(
        addHabit: (newHabitName) {addHabit(newHabitName);},
      ),
      body: ListView.builder(
        itemCount: todaysHabits.length, 
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {toggleHabitStatus(context, index);},
            child: HabitTile(
              key: Key(index.toString()),
              habitName: todaysHabits[index][0],
              habitStatus: todaysHabits[index][1],
              toggleHabitStatus: (context) {toggleHabitStatus(context, index);},
            ),
          );
        },
      ),
    );
  }
}