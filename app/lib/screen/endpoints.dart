import 'package:flutter/material.dart';
import 'package:wakey/screen/add/add_endpoint.dart';
import 'package:wakey/widget/list/endpoint_list_item.dart';

import '../dialog/error_dialog.dart';
import '../endpoint/endpoint.dart';
import '../storage/app_storage.dart';
import '../widget/app_bar.dart';

class EndpointScreen extends StatefulWidget {
  const EndpointScreen({super.key});

  @override
  State<StatefulWidget> createState() => EndpointScreenState();
}

class EndpointScreenState extends State<EndpointScreen> {

  late List<Endpoint> endpoints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Endpoints"),
      floatingActionButton: FloatingActionButton.extended(onPressed: _addEndpoint, label: const Text("Add endpoint")),
      body: Scrollbar(
        child: ListView(
          restorationId: "endpoints_list_view",
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for(int i = 0; i < endpoints.length; i++)
              EndpointTile(endpoints[i], () {
                // If edit button is pressed
              })
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    endpoints = AppStorage.pullEndpoints();
  }

  void _addEndpoint() {
    if(AppStorage.pullLocations().isEmpty) {
      showFailedDialog(context, "Failed to add endpoint", "It seems like you haven't added a location yet, please add one first.");
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddEndpointScreen(endpoints, (endpoint) => setState(() {
      endpoints.add(endpoint);
      AppStorage.writeEndpoints(endpoints);
    }))));
  }

}