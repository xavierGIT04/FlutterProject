import 'package:flutter/material.dart';
import 'ScreenBibliotheque.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeatFlow',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, //fond d'écran noir
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0 // aucun ombre sous l'appbar
        )
      ),
      home: Screenbibliotheque()
    );
  }
}


