import 'package:flutter/material.dart';

class AddWakeOverLan extends StatelessWidget {

  final TextEditingController addressController;
  final TextEditingController macAddressController;

  const AddWakeOverLan(this.addressController, this.macAddressController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
            decoration: const InputDecoration(hintText: "Address (Local network)"),
            controller: addressController,
          )),
          Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
            decoration: const InputDecoration(hintText: "MAC-Address"),
            controller: macAddressController,
          )),
        ]
    );
  }

}