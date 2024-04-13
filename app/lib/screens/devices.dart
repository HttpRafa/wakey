import 'package:flutter/material.dart';
import 'package:wakey/widgets/app_bar.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<StatefulWidget> createState() => DevicesScreenState();
}

class DevicesScreenState extends State<DevicesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateStandardAppBar(context, "Devices"),

    );
  }

}