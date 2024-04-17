import 'package:flutter/material.dart';
import 'package:wakey/screen/locations.dart';
import 'package:wakey/screen/settings.dart';

import 'endpoints.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.device_hub), label: "Endpoints"),
          NavigationDestination(icon: Icon(Icons.location_on), label: "Locations"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
      body: [
        const EndpointScreen(),
        const LocationsScreen(),
        const SettingsScreen()
      ][currentPageIndex],
    );
  }

}