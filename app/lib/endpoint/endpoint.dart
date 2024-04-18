import 'package:wakey/endpoint/location.dart';

class Endpoint {

  Location location;
  String name;

  Endpoint(this.location, this.name);

  factory Endpoint.fromJson(Map<String, dynamic> json) => Endpoint(Location.fromJson(json["location"]), json["name"]);

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "name": name
  };

}