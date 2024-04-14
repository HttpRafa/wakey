import 'package:flutter/material.dart';
import 'package:wakey/device/device.dart';

import '../device/location.dart';

void showAddDeviceDialog(BuildContext context, List<Device> devices, List<Location> locations, Function(Device) callback) {
  if(locations.isNotEmpty) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Add device"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Location"),
          DropdownButton(
            hint: const Text('Please choose a location'), // Not necessary for Option 1
            value: locations.first.name,
            onChanged: (newValue) {
            },
            items: locations.map((location) {
              return DropdownMenuItem(
                value: location,
                child: Text(location.name),
              );
            }).toList(),
          ),
          const Padding(padding: EdgeInsets.only(top: 15), child: Text("Device")),
          const TextField(
            decoration: InputDecoration(hintText: "Name"),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text("Add")),
      ],
    ));
  } else {
    showFailedDialog(context, "Failed to add device", "It seems like you haven't added a location yet, please add one first.");
  }
}

void showFailedDialog(BuildContext context, String title, String message) {
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
    ],
  ));
}