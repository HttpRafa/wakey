import 'package:flutter/material.dart';

import '../widget/app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Settings"),
    );
  }

}