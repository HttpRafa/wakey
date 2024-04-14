import 'package:flutter/material.dart';
import 'package:wakey/screen/home.dart';

class WakeyApp extends StatelessWidget {
  const WakeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wakey",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.dark),
        brightness: Brightness.dark,
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }

}