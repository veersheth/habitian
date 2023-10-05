import 'package:flutter/material.dart';

class HabitTile extends StatefulWidget {
  final String habitName;
  final bool habitStatus;
  final toggleHabitStatus;
  const HabitTile({super.key, required this.habitName, required this.habitStatus, required this.toggleHabitStatus});

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.habitName, 
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          Checkbox(
            value: widget.habitStatus, 
            onChanged: (context) {
              widget.toggleHabitStatus(context);
              },
            ),
        ],
      ),
    );
  }
}