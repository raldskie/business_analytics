// To parse this JSON data, do
//
//     final establishment = establishmentFromJson(jsonString);

import 'dart:convert';

Establishment establishmentFromJson(String str) =>
    Establishment.fromJson(json.decode(str));

String establishmentToJson(Establishment data) => json.encode(data.toJson());

class Establishment {
  Establishment({
    required this.name,
    required this.location,
    required this.photo,
    required this.visitorsPerDay,
  });

  String name;
  String location;
  String photo;
  String visitorsPerDay;

  factory Establishment.fromJson(Map<String, dynamic> json) => Establishment(
        name: json["name"],
        location: json["location"],
        photo: json["photo"],
        visitorsPerDay: json["visitorsPerDay"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "photo": photo,
        "visitorsPerDay": visitorsPerDay,
      };
}
