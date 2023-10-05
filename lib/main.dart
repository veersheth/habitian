import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/habits_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.cabinTextTheme(
         Theme.of(context).textTheme,
       ),
      ),
      home: const HabitsPage(),
    );
  }
}
