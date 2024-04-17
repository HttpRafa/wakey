import 'package:flutter/material.dart';
import 'package:wakey/storage/app_storage.dart';
import 'package:wakey/widget/app_bar.dart';

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
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        AppStorage.writeLocations([]);
        AppStorage.writeEndpoints([]);
      }, label: const Text("Clear data")),
      body: Text(AppStorage.pullLocations().length.toString()),
    );
  }

}