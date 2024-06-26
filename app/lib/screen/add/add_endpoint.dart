import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/screen/info/endpoint_info.dart';
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
    return Scaffold(
      appBar: generateStandardAppBar(context, "Add info"),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EndpointInfo(locations, currentLocation, currentEndpointType, nameController, addressController, macAddressController, httpEndpointController, (location) => setState(() => currentLocation = location), (type) => setState(() => currentEndpointType = type)),
              Padding(padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                      onPressed: _addEndpoint, child: const Text("Add info")))
            ],
          ),
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
      var endpoint = Endpoint(currentLocation, nameController.text, currentEndpointType);
      // TODO: Validate that location is correct
      widget.callback(endpoint);

      Navigator.pop(context);

      // Clear input fields
      nameController.clear();

      addressController.clear();
      macAddressController.clear();

      httpEndpointController.clear();
      return;
    }

    const snackBar = SnackBar(content: Text(
        "There is already a info with the same name"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}