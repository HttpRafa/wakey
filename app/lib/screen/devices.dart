import 'package:flutter/material.dart';
import 'package:wakey/device/device.dart';
import 'package:wakey/dialog/add_device_dialog.dart';
import 'package:wakey/storage/app_storage.dart';

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
      floatingActionButton: FloatingActionButton.extended(onPressed: _addDevice, label: const Text("Add device")),
    );
  }

  @override
  void initState() {
    super.initState();

    devices = AppStorage.pullDevices();
  }

  void _addDevice() {
    showAddDeviceDialog(context, devices, AppStorage.pullLocations(), (p0) => null);
  }

}