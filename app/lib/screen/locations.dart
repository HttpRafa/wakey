import 'package:flutter/material.dart';
import 'package:wakey/screen/add/add_location.dart';
import 'package:wakey/storage/app_storage.dart';

import '../endpoint/location.dart';
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
      body: Scrollbar(
        child: ListView(
          restorationId: "locations_list_view",
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for(int i = 0; i < locations.length; i++)
              ListTile(
                leading: const ExcludeSemantics(
                  child: CircleAvatar(
                    child: Icon(Icons.location_on),
                  ),
                ),
                title: Text(
                    locations[i].name
                ),
                subtitle: Text(locations[i].address),
              )
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

  void _addLocation() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddLocationScreen(locations, (location) => setState(() {
      locations.add(location);
      AppStorage.writeLocations(locations);
    }))));
  }

}