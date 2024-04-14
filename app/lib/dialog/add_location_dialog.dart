import 'package:flutter/material.dart';

import '../device/location.dart';

class AddLocationDialog {
  static final nameController = TextEditingController();
  static final addressController = TextEditingController();
  static final tokenController = TextEditingController();
  
  static void show(BuildContext context, List<Location> locations, Function(Location) callback) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Add location"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Name"),
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Address"),
            controller: addressController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: "Token"),
            controller: tokenController,
            obscureText: true,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        TextButton(onPressed: () {
          if(!locations.any((element) => element.name == nameController.text)) {
            Location location = Location(UniqueKey(), nameController.text, addressController.text, tokenController.text);
            // TODO: Validate that location is correct
            callback(location);

            Navigator.pop(context);
          }
          
          const snackBar = SnackBar(content: Text("There is already a location with the same name"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, child: const Text("Add")),
      ],
    ));
  }
}