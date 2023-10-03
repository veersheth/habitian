import 'package:flutter/material.dart';
import 'package:habitian/widgets/fab_add_habit.dart';
import 'package:habitian/widgets/habit_name_alert.dart';
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
        title: const Text("Your Habits"),
      ),
      floatingActionButton: FABAddHabit(
        addHabit: (newHabitName) {addHabit(newHabitName);},
      ),
      body: ListView.builder(
        itemCount: todaysHabits.length, 
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {toggleHabitStatus(context, index);},
            onLongPress: () {
              showModalBottomSheet(
                context: context, 
                builder: (BuildContext context) {
                return Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondaryContainer),
                          iconColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onSecondaryContainer),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          showDialog(context: context, builder: (context) {
                            return HabitNameAlert(
                              saveHabitName: (habitName) {
                                setState(() {
                                  todaysHabits[index][0] = habitName;
                                  });
                                }
                              );
                            }
                          );
                        }, 
                        child: const Text("Rename"),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.errorContainer),
                          iconColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onErrorContainer),
                        ),
                        onPressed: () {
                          setState(() {
                            todaysHabits.removeAt(index);
                          });
                          Navigator.pop(context);
                        }, 
                        child: const Text("Delete"),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondaryContainer),
                          iconColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onSecondaryContainer),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        child: const Text("Cancel"),
                      ),
                    ],
                  ),
                );
              });
            },
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