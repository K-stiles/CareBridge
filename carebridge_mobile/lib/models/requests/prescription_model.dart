import 'dart:convert';
import 'package:the_rock_mobile/models/requests/prescription_drug_model.dart';

CreatePrescriptionPayload createPrescriptionPayloadFromJson(String str) =>
    CreatePrescriptionPayload.fromJson(json.decode(str));

String createPrescriptionPayloadToJson(CreatePrescriptionPayload data) =>
    json.encode(data.toJson());

class CreatePrescriptionPayload {
  String name;
  String description;
  List<DrugId> drugIds;
  String doctorId;
  String patientId;

  CreatePrescriptionPayload({
    required this.name,
    required this.description,
    required this.drugIds,
    required this.doctorId,
    required this.patientId,
  });

  factory CreatePrescriptionPayload.fromJson(Map<String, dynamic> json) =>
      CreatePrescriptionPayload(
        name: json["name"],
        description: json["description"],
        drugIds:
            List<DrugId>.from(json["drugIds"].map((x) => DrugId.fromJson(x))),
        doctorId: json["doctorId"],
        patientId: json["patientId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "drugIds": List<dynamic>.from(drugIds.map((x) => x.toJson())),
        "doctorId": doctorId,
        "patientId": patientId,
      };
}

class DrugId {
  String id;

  DrugId({required this.id});

  factory DrugId.fromJson(Map<String, dynamic> json) => DrugId(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

CreatePrescriptionResponse createPrescriptionResponseFromJson(String str) =>
    CreatePrescriptionResponse.fromJson(json.decode(str));

String createPrescriptionResponseToJson(CreatePrescriptionResponse data) =>
    json.encode(data.toJson());

class CreatePrescriptionResponse {
  String id;
  String name;
  String description;
  String doctorId;
  String patientId;
  bool removed;
  DateTime createdAt;
  DateTime updatedAt;
  List<Drug> drugs;

  CreatePrescriptionResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.doctorId,
    required this.patientId,
    required this.removed,
    required this.createdAt,
    required this.updatedAt,
    required this.drugs,
  });

  factory CreatePrescriptionResponse.fromJson(Map<String, dynamic> json) =>
      CreatePrescriptionResponse(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        doctorId: json["doctorId"],
        patientId: json["patientId"],
        removed: json["removed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        drugs: List<Drug>.from(json["drugs"].map((x) => Drug.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "doctorId": doctorId,
        "patientId": patientId,
        "removed": removed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "drugs": List<dynamic>.from(drugs.map((x) => x.toJson())),
      };
}
