import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_game/Pages/home.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.   key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.itim().fontFamily,
      ),

      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
