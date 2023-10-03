import 'package:flutter/material.dart';
import '../widgets/Habit_Tile.dart';

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

  void toggleHabitStatus(index) {
    setState(() {
      todaysHabits[index][1] = !todaysHabits[index][1];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Habits"),
      ),
      body: ListView.builder(
        itemCount: todaysHabits.length, 
        itemBuilder: (context, index) {
          return HabitTile(
            key: Key(index.toString()),
            habitName: todaysHabits[index][0],
            habitStatus: todaysHabits[index][1],
            toggleHabitStatus: (context) {toggleHabitStatus(index);},
          );
        },
      ),
    );
  }
}