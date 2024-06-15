import 'dart:convert';

String updatePatientPayloadToJson(UpdatePatientPayload data) =>
    json.encode(data.toJson());

class UpdatePatientPayload {
  String fullname;
  String email;
  String phone;

  UpdatePatientPayload({
    required this.fullname,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "phone": phone,
      };
}

/// DOCTOR
String updateDoctorPayloadToJson(UpdateDoctorPayload data) =>
    json.encode(data.toJson());

class UpdateDoctorPayload {
  String email;
  String fullname;
  String qualification;

  UpdateDoctorPayload({
    required this.email,
    required this.fullname,
    required this.qualification,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "qualification": qualification,
      };
}
