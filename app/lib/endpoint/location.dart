class Location {

  String identifier;
  String name;
  String address;
  String token;

  Location(this.identifier, this.name, this.address, this.token);

  factory Location.fromJson(Map<String, dynamic> json) => Location(json["identifier"], json["name"], json["address"], json["token"]);

  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "name": name,
    "address": address,
    "token": token
  };

}