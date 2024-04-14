import 'package:flutter/material.dart';

class Device {

  UniqueKey locationKey;
  String name;

  Device(this.locationKey, this.name);

  factory Device.fromJson(Map<String, dynamic> json) => Device(json["locationKey"], json["name"]);

  Map<String, dynamic> toJson() => {
    "locationKey": locationKey,
    "name": name
  };

}