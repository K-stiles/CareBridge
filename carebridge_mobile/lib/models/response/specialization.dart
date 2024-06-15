import 'dart:convert';

List<Specialization> specializationFromJson(String str) =>
    List<Specialization>.from(
        json.decode(str).map((x) => Specialization.fromJson(x)));

String specializationToJson(List<Specialization> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Specialization {
  String id;
  String name;
  bool removed;
  DateTime createdAt;
  DateTime updatedAt;

  Specialization({
    required this.id,
    required this.name,
    required this.removed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["id"],
        name: json["name"],
        removed: json["removed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "removed": removed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
