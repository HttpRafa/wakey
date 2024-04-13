import 'package:flutter/material.dart';
import 'package:wakey/screens/devices.dart';

class WakeyApp extends StatelessWidget {
  const WakeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wakey",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 114, 137, 218), brightness: Brightness.dark),
        brightness: Brightness.dark,
        useMaterial3: true
      ),
      home: const DevicesScreen(),
    );
  }

}