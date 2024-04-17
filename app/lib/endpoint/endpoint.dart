class Endpoint {

  String locationKey;
  String name;

  Endpoint(this.locationKey, this.name);

  factory Endpoint.fromJson(Map<String, dynamic> json) => Endpoint(json["locationKey"], json["name"]);

  Map<String, dynamic> toJson() => {
    "locationKey": locationKey,
    "name": name
  };

}