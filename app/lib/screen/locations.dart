import 'package:flutter/material.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/screen/add/add_location.dart';
import 'package:wakey/screen/edit/edit_location.dart';
import 'package:wakey/storage/app_storage.dart';
import 'package:wakey/widget/app_bar.dart';
import 'package:wakey/widget/list/location_list_item.dart';

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
      body: Scrollbar(
        child: ListView(
          restorationId: "locations_list_view",
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for(int i = 0; i < locations.length; i++)
              LocationTile(locations[i], _editLocation)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    locations = AppStorage.pullLocations();
  }

  void _editLocation(Location location) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditLocationScreen(location, () {
      // Save location
      AppStorage.writeLocations(locations);

      // Update existing endpoints
      var endpoints = AppStorage.pullEndpoints();
      for (var element in endpoints) {
        if(element.location.identifier == location.identifier) {
          element.location = location;
        }
      }
      AppStorage.writeEndpoints(endpoints);
      setState(() {});
    })));
  }
  
  void _addLocation() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddLocationScreen(locations, (location) => setState(() {
      locations.add(location);
      AppStorage.writeLocations(locations);
    }))));
  }

}