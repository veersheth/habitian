import 'package:flutter/material.dart';
import 'package:habitian/widgets/fab_add_habit.dart';
import 'package:habitian/widgets/habit_name_alert.dart';
import '../widgets/habit_tile.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

List todaysHabits = [
  ["Read", false ],
  ["Meditate", false ],
  ["Strength", false ],
  ["Cardio", false ],
  ["Journal", false ],
];

class _HabitsPageState extends State<HabitsPage> {

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
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        title: const Text("Today's Habits"),
        toolbarHeight: 80,
      ),
      floatingActionButton: FABAddHabit(
        addHabit: (newHabitName) {addHabit(newHabitName);},
      ),
      body: ListView.builder(
        // padding: const EdgeInsets.only(top: 20),
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