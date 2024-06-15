import 'dart:convert';

String addAppointmentPayloadToJson(AddAppointmentPayload data) =>
    json.encode(data.toJson());

class AddAppointmentPayload {
  String complaint;
  DateTime scheduledDate;
  String medium;
  String serviceId;
  String doctorId;

  AddAppointmentPayload({
    required this.complaint,
    required this.scheduledDate,
    required this.medium,
    required this.serviceId,
    required this.doctorId,
  });

  Map<String, dynamic> toJson() => {
        "complaint": complaint,
        "scheduledDate": scheduledDate.toIso8601String(),
        "medium": medium,
        "serviceId": serviceId,
        "doctorId": doctorId,
      };
}
