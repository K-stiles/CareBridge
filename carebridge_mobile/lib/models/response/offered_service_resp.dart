import 'dart:convert';

List<OfferedServiceResp> offeredServiceRespFromJson(String str) =>
    List<OfferedServiceResp>.from(
        json.decode(str).map((x) => OfferedServiceResp.fromJson(x)));

String offeredServiceRespToJson(List<OfferedServiceResp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OfferedServiceResp {
  String id;
  String name;
  bool removed;
  DateTime createdAt;
  DateTime updatedAt;
  List<Doctor> doctors;

  OfferedServiceResp({
    required this.id,
    required this.name,
    required this.removed,
    required this.createdAt,
    required this.updatedAt,
    required this.doctors,
  });

  factory OfferedServiceResp.fromJson(Map<String, dynamic> json) =>
      OfferedServiceResp(
        id: json["id"],
        name: json["name"],
        removed: json["removed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        doctors:
            List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "removed": removed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
      };
}

class Doctor {
  String id;
  String fullname;

  Doctor({
    required this.id,
    required this.fullname,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
      };
}
