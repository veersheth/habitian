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
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.habitName, 
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          Checkbox(
            value: widget.habitStatus, 
            onChanged: (context) {
              print("tapped");
              widget.toggleHabitStatus(context);
              },
            ),
        ],
      ),
    );
  }
}