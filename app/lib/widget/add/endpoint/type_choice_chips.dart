import 'package:flutter/material.dart';
import 'package:wakey/endpoint/endpoint.dart';

class TypeChoiceChips extends StatelessWidget {

  final EndpointType type;
  final Function(EndpointType) onChanged;

  const TypeChoiceChips(this.type, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: [
        ChoiceChip(label: const Text("Wake-over-LAN"),
            selected: type == EndpointType.wakeOverLan,
            onSelected: (value) => onChanged(EndpointType.wakeOverLan)),
        ChoiceChip(label: const Text("HTTP-Request"),
            selected: type == EndpointType.httpRequest,
            onSelected: (value) => onChanged(EndpointType.httpRequest)),
      ],
    );
  }

}