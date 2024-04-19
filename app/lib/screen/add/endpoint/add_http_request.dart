import 'package:flutter/material.dart';

class AddHttpRequest extends StatelessWidget {

  final TextEditingController httpEndpointController;

  const AddHttpRequest(this.httpEndpointController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
            decoration: const InputDecoration(hintText: "HTTP-Endpoint"),
            controller: httpEndpointController,
          )),
        ]
    );
  }

}