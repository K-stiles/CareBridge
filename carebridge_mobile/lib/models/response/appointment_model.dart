import 'dart:convert';

List<Appointment> appointmentFromJson(String str) => List<Appointment>.from(
    json.decode(str).map((x) => Appointment.fromJson(x)));

String appointmentToJson(List<Appointment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appointment {
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
  Patient patient;

  Appointment({
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
    required this.patient,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
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
