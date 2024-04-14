import 'package:flutter/material.dart';

import '../widget/app_bar.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<StatefulWidget> createState() => LocationsScreenState();
}

class LocationsScreenState extends State<LocationsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Locations"),
      floatingActionButton: FloatingActionButton.extended(onPressed: addLocation, label: const Text("Add location")),
    );
  }

  void addLocation() {

  }

}