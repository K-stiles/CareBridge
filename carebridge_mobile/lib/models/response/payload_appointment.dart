import 'dart:convert';

/// PAYLOAD
CreateAppointmentPayload createAppointmentPayloadFromJson(String str) =>
    CreateAppointmentPayload.fromJson(json.decode(str));

String createAppointmentPayloadToJson(CreateAppointmentPayload data) =>
    json.encode(data.toJson());

class CreateAppointmentPayload {
  String complaint;
  String scheduledDate;
  String medium;
  String serviceId;
  String doctorId;

  CreateAppointmentPayload({
    required this.complaint,
    required this.scheduledDate,
    required this.medium,
    required this.serviceId,
    required this.doctorId,
  });

  factory CreateAppointmentPayload.fromJson(Map<String, dynamic> json) =>
      CreateAppointmentPayload(
        complaint: json["complaint"],
        scheduledDate: json["scheduledDate"],
        medium: json["medium"],
        serviceId: json["serviceId"],
        doctorId: json["doctorId"],
      );

  Map<String, dynamic> toJson() => {
        "complaint": complaint,
        "scheduledDate": scheduledDate,
        "medium": medium,
        "serviceId": serviceId,
        "doctorId": doctorId,
      };
}

/// RESPONSE
CreateAppointmentResponse createAppointmentResponseFromJson(String str) =>
    CreateAppointmentResponse.fromJson(json.decode(str));

String createAppointmentResponseToJson(CreateAppointmentResponse data) =>
    json.encode(data.toJson());

class CreateAppointmentResponse {
  String id;
  String complaint;
  DateTime scheduledDate;
  String medium;
  String patientId;
  String doctorId;
  String serviceId;
  bool removed;
  DateTime createdAt;
  DateTime updatedAt;
  Service service;
  Patient patient;

  CreateAppointmentResponse({
    required this.id,
    required this.complaint,
    required this.scheduledDate,
    required this.medium,
    required this.patientId,
    required this.doctorId,
    required this.serviceId,
    required this.removed,
    required this.createdAt,
    required this.updatedAt,
    required this.service,
    required this.patient,
  });

  factory CreateAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      CreateAppointmentResponse(
        id: json["id"],
        complaint: json["complaint"],
        scheduledDate: DateTime.parse(json["scheduledDate"]),
        medium: json["medium"],
        patientId: json["patientId"],
        doctorId: json["doctorId"],
        serviceId: json["serviceId"],
        removed: json["removed"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        service: Service.fromJson(json["service"]),
        patient: Patient.fromJson(json["patient"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "complaint": complaint,
        "scheduledDate": scheduledDate.toIso8601String(),
        "medium": medium,
        "patientId": patientId,
        "doctorId": doctorId,
        "serviceId": serviceId,
        "removed": removed,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "service": service.toJson(),
        "patient": patient.toJson(),
      };
}

class Patient {
  String fullname;

  Patient({
    required this.fullname,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
      };
}

class Service {
  String name;

  Service({
    required this.name,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
