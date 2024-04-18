import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../endpoint/endpoint.dart';
import '../endpoint/location.dart';

class AppStorage {

  static const _keyEndpoints = "endpoints";
  static const _keyLocations = "list";

  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future writeEndpoints(List<Endpoint> endpoints) async => await _preferences.setString(_keyEndpoints, jsonEncode(endpoints));
  static Future writeLocations(List<Location> locations) async => await _preferences.setString(_keyLocations, jsonEncode(locations));

  static List<Endpoint> pullEndpoints() {
    final data = _preferences.getString(_keyEndpoints);
    if(data != null) {
      List<dynamic> endpoints = jsonDecode(data);
      return List<Endpoint>.from(endpoints.map((e) => Endpoint.fromJson(e)));
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