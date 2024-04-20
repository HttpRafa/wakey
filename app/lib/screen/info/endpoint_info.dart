import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/screen/add/endpoint/add_http_request.dart';
import 'package:wakey/screen/add/endpoint/add_wake_over_lan.dart';
import 'package:wakey/widget/add/endpoint/location_drop_down.dart';
import 'package:wakey/widget/add/endpoint/type_choice_chips.dart';

class EndpointInfo extends StatelessWidget {

  final List<Location> locations;
  final Location currentLocation;
  final EndpointType currentEndpointType;

  final TextEditingController nameController;

  // Wake-over-LAN
  final TextEditingController addressController;
  final TextEditingController macAddressController;

  // HTTP-Request
  final TextEditingController httpEndpointController;

  final Function(Location) onLocationChanged;
  final Function(EndpointType) onTypeChanged;

  const EndpointInfo(this.locations, this.currentLocation,
      this.currentEndpointType, this.nameController, this.addressController,
      this.macAddressController, this.httpEndpointController,
      this.onLocationChanged, this.onTypeChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 25),
            child: Text("Location information")),

        // Location info
        Padding(
            padding: const EdgeInsets.only(top: 5),
            child: LocationDropDown(
                locations, currentLocation, onLocationChanged)),

        const Padding(padding: EdgeInsets.only(top: 25),
            child: Text("General info information")),

        // General Endpoint info
        Padding(padding: const EdgeInsets.only(top: 5),
            child: TypeChoiceChips(currentEndpointType, onTypeChanged)),
        Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
          decoration: const InputDecoration(hintText: "Name"),
          controller: nameController,
        )),

        const Padding(padding: EdgeInsets.only(top: 25),
            child: Text("Endpoint information")),

        // Endpoint info
        if(currentEndpointType == EndpointType.wakeOverLan) AddWakeOverLan(
            addressController, macAddressController) else
          AddHttpRequest(httpEndpointController)
      ],
    );
  }

}