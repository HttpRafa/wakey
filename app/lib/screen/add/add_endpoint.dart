import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/storage/app_storage.dart';
import 'package:wakey/widget/app_bar.dart';

class AddEndpointScreen extends StatefulWidget {

  final List<Endpoint> endpoints;
  final Function(Endpoint) callback;

  const AddEndpointScreen(this.endpoints, this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => AddEndpointScreenState();
}

class AddEndpointScreenState extends State<AddEndpointScreen> {

  static final nameController = TextEditingController();

  final List<Location> locations = AppStorage.pullLocations();
  late Location currentLocation = AppStorage.pullLocations().first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Add endpoint"),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.only(top: 25),
                child: Text("Location information")),
            Padding(padding: const EdgeInsets.only(top: 5), child: DropdownButton(
              hint: const Text('Please choose a location'), // Not necessary for Option 1
              value: currentLocation.name,
              onChanged: (value) => setState(() {
                currentLocation = locations.firstWhere((element) => element.name == value);
              }),
              items: locations.map((location) {
                return DropdownMenuItem(
                  value: location.name,
                  child: Text(location.name),
                );
              }).toList(),
            )),
            const Padding(padding: EdgeInsets.only(top: 25),
                child: Text("Endpoint information")),
            Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
              decoration: const InputDecoration(hintText: "Name"),
              controller: nameController,
            )),
            Padding(padding: const EdgeInsets.only(top: 10),
                child: TextButton(onPressed: _addEndpoint, child: const Text("Add endpoint")))
          ],
        ),
      ),
    );
  }

  void _addEndpoint() {
    if(nameController.text.isEmpty) {
      const snackBar = SnackBar(content: Text(
          "Please enter a valid name"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (!widget.endpoints.any((element) => element.name == nameController.text)) {
      Endpoint endpoint = Endpoint(currentLocation.key, nameController.text);
      // TODO: Validate that location is correct
      widget.callback(endpoint);

      Navigator.pop(context);

      // Clear input fields
      nameController.clear();
      return;
    }

    const snackBar = SnackBar(content: Text(
        "There is already a endpoint with the same name"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}