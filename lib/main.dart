import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 132, 0, 51),
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.rubikTextTheme()),
      home: const TabsScreen(),
    );
  }
}
