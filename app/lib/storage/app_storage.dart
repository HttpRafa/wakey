import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakey/device/location.dart';

import '../device/device.dart';

class AppStorage {

  static const _keyDevices = "devices";
  static const _keyLocations = "locations";

  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future writeDevices(List<Device> devices) async => await _preferences.setString(_keyDevices, jsonEncode(devices));
  static Future writeLocations(List<Location> locations) async => await _preferences.setString(_keyLocations, jsonEncode(locations));

  static List<Device> pullDevices() {
    final data = _preferences.getString(_keyDevices);
    if(data != null) {
      List<dynamic> devices = jsonDecode(data);
      return List<Device>.from(devices.map((e) => Device.fromJson(e)));
    }
    return [];
  }
  static List<Location> pullLocations() {
    final data = _preferences.getString(_keyLocations);
    if(data != null) {
      List<dynamic> locations = jsonDecode(data);
      return List<Location>.from(locations.map((e) => Location.fromJson(e)));
    }
    return [];
  }

}