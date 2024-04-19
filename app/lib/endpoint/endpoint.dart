import 'package:wakey/endpoint/location.dart';

class Endpoint {

  Location location;
  String name;
  EndpointType type;

  Endpoint(this.location, this.name, this.type);

  factory Endpoint.fromJson(Map<String, dynamic> json) => Endpoint(Location.fromJson(json["location"]), json["name"], EndpointType.values.byName(json["type"]));

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "name": name,
    "type": type.name,
  };

}

enum EndpointType {
  wakeOverLan,
  httpRequest
}