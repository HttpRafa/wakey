import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';

class EndpointTile extends StatelessWidget {

  final Endpoint endpoint;
  final Function(Endpoint) startClicked;
  final Function(Endpoint) editClicked;

  const EndpointTile(this.endpoint, this.startClicked, this.editClicked, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ExcludeSemantics(
        child: CircleAvatar(
          child: Icon(
            endpoint.type == EndpointType.wakeOverLan ? Icons.device_hub : Icons.http
          ),
        ),
      ),
      title: Text(endpoint.name),
      subtitle: Text(endpoint.location.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () => startClicked(endpoint),
            child: const Icon(
                Icons.play_arrow,
                color: Colors.blue
            ),
          ),
          const SizedBox(width: 8), // Add some space between buttons
          ElevatedButton(
            onPressed: () => editClicked(endpoint),
            child: const Icon(
                Icons.edit,
                color: Colors.green
            ),
          ),
        ],
      ),
    );

  }

}