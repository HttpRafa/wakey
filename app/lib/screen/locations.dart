import 'package:flutter/material.dart';
import 'package:wakey/device/location.dart';
import 'package:wakey/dialog/add_location_dialog.dart';
import 'package:wakey/storage/app_storage.dart';

import '../widget/app_bar.dart';

class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<StatefulWidget> createState() => LocationsScreenState();
}

class LocationsScreenState extends State<LocationsScreen> {

  late List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Locations"),
      floatingActionButton: FloatingActionButton.extended(onPressed: _addLocation, label: const Text("Add location")),
    );
  }

  @override
  void initState() {
    super.initState();

    locations = AppStorage.pullLocations();
  }

  void _addLocation() {
    AddLocationDialog.show(context, locations, (location) => setState(() {
      locations.add(location);
      AppStorage.writeLocations(locations);
    }));
  }

}