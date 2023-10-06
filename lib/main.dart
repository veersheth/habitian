import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/habits_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("habits_db");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.syneTextTheme(
         Theme.of(context).textTheme,
       ),
      ),
      home: const HabitsPage(),
    );
  }
}
