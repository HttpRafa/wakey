import 'package:flutter/material.dart';
import 'package:wakey/endpoint/location.dart';

class LocationTile extends StatelessWidget {

  final Location location;
  final Function(Location) editClicked;

  const LocationTile(this.location, this.editClicked, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ExcludeSemantics(
        child: CircleAvatar(
          child: Icon(Icons.location_on),
        ),
      ),
      title: Text(
          location.name
      ),
      subtitle: Text(location.address),
      trailing: ElevatedButton(
        onPressed: () => editClicked(location),
        child: const Icon(
          Icons.edit,
          color: Colors.green
        ),
      ),
    );
  }

}