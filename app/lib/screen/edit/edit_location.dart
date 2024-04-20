import 'package:flutter/material.dart';
import 'package:wakey/endpoint/location.dart';
import 'package:wakey/screen/info/location_info.dart';
import 'package:wakey/widget/app_bar.dart';

class EditLocationScreen extends StatefulWidget {

  final Location location;
  final Function() saveCallback;

  const EditLocationScreen(this.location, this.saveCallback, {super.key});

  @override
  State<StatefulWidget> createState() => EditLocationScreenState();
}

class EditLocationScreenState extends State<EditLocationScreen> {

  static final nameController = TextEditingController();
  static final addressController = TextEditingController();
  static final tokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Set controllers to right values
    return Scaffold(
      appBar: generateStandardAppBar(context, "Edit info"),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LocationInfo(nameController, addressController, tokenController),
              Padding(padding: const EdgeInsets.only(top: 10),
                  child: TextButton(onPressed: _saveLocation, child: const Text("Save info")))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.location.name;
    addressController.text = widget.location.address;
    tokenController.text = widget.location.token;
  }

  void _saveLocation() {
    widget.location.name = nameController.text;
    widget.location.address = addressController.text;
    widget.location.token = tokenController.text;
    widget.saveCallback();
    Navigator.pop(context);
  }

}