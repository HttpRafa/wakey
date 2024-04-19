import 'package:flutter/material.dart';
import 'package:wakey/endpoint/location.dart';

class LocationDropDown extends StatelessWidget {

  final List<Location> values;
  final Location value;
  final Function(Location) onChanged;

  const LocationDropDown(this.values, this.value, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: const Text('Please choose a location'),
      // Not necessary for Option 1
      value: value.name,
      onChanged: (value) =>
          onChanged(values.firstWhere((element) => element.name == value)),
      items: values.map((location) {
        return DropdownMenuItem(
          value: location.name,
          child: Text(location.name),
        );
      }).toList(),
    );
  }

}