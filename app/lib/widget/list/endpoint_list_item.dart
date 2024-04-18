import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';

class EndpointTile extends StatelessWidget {

  final Endpoint endpoint;
  final Function() callback;

  const EndpointTile(this.endpoint, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ExcludeSemantics(
        child: CircleAvatar(
          child: Icon(Icons.device_hub),
        ),
      ),
      title: Text(endpoint.name),
      subtitle: Text(endpoint.location.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            child: const Icon(
                Icons.play_arrow,
                color: Colors.blue
            ),
          ),
          const SizedBox(width: 8), // Add some space between buttons
          ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
            },
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