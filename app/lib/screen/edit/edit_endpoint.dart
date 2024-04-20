import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/screen/info/endpoint_info.dart';
import 'package:wakey/storage/app_storage.dart';
import 'package:wakey/widget/app_bar.dart';

class EditEndpointScreen extends StatefulWidget {

  final Endpoint endpoint;
  final Function() saveCallback;

  const EditEndpointScreen(this.endpoint, this.saveCallback, {super.key});

  @override
  State<StatefulWidget> createState() => EditEndpointScreenState();
}

class EditEndpointScreenState extends State<EditEndpointScreen> {

  static final nameController = TextEditingController();

  // Wake-over-LAN
  static final addressController = TextEditingController();
  static final macAddressController = TextEditingController();

  // HTTP-Request
  static final httpEndpointController = TextEditingController();

  final List<Location> locations = AppStorage.pullLocations();
  late Location currentLocation = AppStorage.pullLocations().first;

  EndpointType currentEndpointType = EndpointType.wakeOverLan;

  @override
  Widget build(BuildContext context) {
    // Set controllers to right values
    return Scaffold(
      appBar: generateStandardAppBar(context, "Edit info"),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EndpointInfo(locations, currentLocation, currentEndpointType, nameController, addressController, macAddressController, httpEndpointController, (location) => setState(() => currentLocation = location), (type) => setState(() => currentEndpointType = type)),
              Padding(padding: const EdgeInsets.only(top: 10),
                  child: TextButton(onPressed: _saveEndpoint, child: const Text("Save info")))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.endpoint.name;
    addressController.text = "No data";
    macAddressController.text = "No data";
    httpEndpointController.text = "No data";
    currentEndpointType = widget.endpoint.type;
    currentLocation = widget.endpoint.location;
  }

  void _saveEndpoint() {
    widget.endpoint.name = nameController.text;
    widget.endpoint.location = currentLocation;
    widget.endpoint.type = currentEndpointType;
    widget.saveCallback();
    Navigator.pop(context);
  }

}