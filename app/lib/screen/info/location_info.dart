import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {

  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController tokenController;

  const LocationInfo(this.nameController, this.addressController, this.tokenController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 25),
            child: Text("Location information")),
        Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
          decoration: const InputDecoration(hintText: "Name"),
          controller: nameController,
        )),
        const Padding(padding: EdgeInsets.only(top: 25),
            child: Text("Server information")),
        Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
          decoration: const InputDecoration(hintText: "Address"),
          controller: addressController,
        )),
        Padding(padding: const EdgeInsets.only(top: 5), child: TextField(
          decoration: const InputDecoration(hintText: "Token"),
          controller: tokenController,
          obscureText: true,
        )),
      ],
    );
  }

}