import 'package:flutter/material.dart';
import 'package:wakey/device/device.dart';

import '../widget/app_bar.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<StatefulWidget> createState() => DevicesScreenState();
}

class DevicesScreenState extends State<DevicesScreen> {

  late List<Device> devices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Devices"),
      floatingActionButton: FloatingActionButton.extended(onPressed: addDevice, label: const Text("Add device")),
    );
  }

  @override
  void initState() {
    super.initState();

    devices = [];
  }

  void addDevice() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Add device"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Location"),
          DropdownButton(
            hint: Text('Please choose a location'), // Not necessary for Option 1
            value: "A",
            onChanged: (newValue) {
            },
            items: ['A', 'B', 'C', 'D'].map((location) {
              return DropdownMenuItem(
                child: new Text(location),
                value: location,
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
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Add")),
      ],
    ));
  }

}