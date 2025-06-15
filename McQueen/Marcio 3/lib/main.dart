import 'package:flutter/material.dart';
import 'home_mcqueen.dart';

void main() {
  runApp(const McQueenApp());
}

class McQueenApp extends StatelessWidget {
  const McQueenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCQUEEN - O Filme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.white,
          secondary: Colors.redAccent,
        ),
      ),
      home: const HomeMcQueen(),
    );
  }
}
