import 'dart:convert';

List<Drug> drugFromJson(String str) =>
    List<Drug>.from(json.decode(str).map((x) => Drug.fromJson(x)));

String drugToJson(List<Drug> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Drug {
  String id;
  String name;
  String dosage;
  bool removed;
  DateTime createdAt;
  DateTime updatedAt;

  Drug({
    required this.id,
    required this.name,
    required this.dosage,
    required this.removed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
        id: json["id"],
        name: json["name"],
        dosage: json["dosage"],
        removed: json["removed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dosage": dosage,
        "removed": removed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
