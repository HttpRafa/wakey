
class Location {

  String key;
  String name;
  String address;
  String token;

  Location(this.key, this.name, this.address, this.token);

  factory Location.fromJson(Map<String, dynamic> json) => Location(json["key"], json["name"], json["address"], json["token"]);

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "address": address,
    "token": token
  };

}