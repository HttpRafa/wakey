import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/screen/info/location_info.dart';
import 'package:wakey/widget/app_bar.dart';

class AddLocationScreen extends StatelessWidget {

  static final nameController = TextEditingController();
  static final addressController = TextEditingController();
  static final tokenController = TextEditingController();

  final List<Location> locations;
  final Function(Location) callback;

  const AddLocationScreen(this.locations, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Add location"),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LocationInfo(nameController, addressController, tokenController),
              Padding(padding: const EdgeInsets.only(top: 10),
                  child: TextButton(onPressed: () => _addLocation(context), child: const Text("Add location")))
            ],
          ),
        ),
      ),
    );
  }

  void _addLocation(BuildContext context) {
    if(nameController.text.isEmpty) {
      const snackBar = SnackBar(content: Text(
          "Please enter a valid name"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (!locations.any((element) => element.name == nameController.text)) {
      var location = Location(const Uuid().v4(), nameController.text, addressController.text, tokenController.text);
      // TODO: Validate that location is correct
      callback(location);

      Navigator.pop(context);

      // Clear input fields
      nameController.clear();
      addressController.clear();
      tokenController.clear();
      return;
    }

    const snackBar = SnackBar(content: Text(
        "There is already a location with the same name"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}