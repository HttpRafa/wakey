import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/screen/add/endpoint/add_http_request.dart';
import 'package:wakey/screen/add/endpoint/add_wake_over_lan.dart';
import 'package:wakey/widget/add/endpoint/location_drop_down.dart';
import 'package:wakey/storage/app_storage.dart';
import 'package:wakey/widget/add/endpoint/type_choice_chips.dart';
import 'package:wakey/widget/app_bar.dart';

class AddEndpointScreen extends StatefulWidget {

  final List<Endpoint> endpoints;
  final Function(Endpoint) callback;

  const AddEndpointScreen(this.endpoints, this.callback, {super.key});

  @override
  State<StatefulWidget> createState() => AddEndpointScreenState();

}

class AddEndpointScreenState extends State<AddEndpointScreen> {

  static const int wakeOverLan = 0;
  static const int httpRequest = 1;

  static final nameController = TextEditingController();

  // Wake-over-LAN
  static final addressController = TextEditingController();
  static final macAddressController = TextEditingController();

  // HTTP-Request
  static final httpEndpointController = TextEditingController();

  final List<Location> locations = AppStorage.pullLocations();
  late Location currentLocation = AppStorage.pullLocations().first;

  EndpointType selectedType = EndpointType.wakeOverLan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Add endpoint"),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(padding: EdgeInsets.only(top: 25),
                  child: Text("Location information")),

              // Location info
              Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: LocationDropDown(
                      locations, currentLocation, (p0) => currentLocation = p0)),

              const Padding(padding: EdgeInsets.only(top: 25),
                  child: Text("General endpoint information")),

              // General Endpoint info
              Padding(padding: const EdgeInsets.only(top: 5),
                  child: TypeChoiceChips(selectedType, (p0) => setState(() => selectedType = p0))),
              Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
                decoration: const InputDecoration(hintText: "Name"),
                controller: nameController,
              )),

              const Padding(padding: EdgeInsets.only(top: 25),
                  child: Text("Endpoint information")),

              // Endpoint info
              if(selectedType == EndpointType.wakeOverLan) AddWakeOverLan(addressController, macAddressController) else
                AddHttpRequest(httpEndpointController),

              Padding(padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                      onPressed: _addEndpoint, child: const Text("Add endpoint")))
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
      Endpoint endpoint = Endpoint(currentLocation, nameController.text, selectedType);
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
        "There is already a endpoint with the same name"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}