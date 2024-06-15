import 'dart:convert';

LoginPatientResp loginPatientRespFromJson(String str) =>
    LoginPatientResp.fromJson(json.decode(str));

class LoginPatientResp {
  Patient patient;
  String accessToken;

  LoginPatientResp({
    required this.patient,
    required this.accessToken,
  });

  factory LoginPatientResp.fromJson(Map<String, dynamic> json) =>
      LoginPatientResp(
        patient: Patient.fromJson(json["patient"]),
        accessToken: json["accessToken"],
      );
}

class Patient {
  String id;
  String fullname;
  String profile;
  String role;

  Patient({
    required this.id,
    required this.fullname,
    required this.profile,
    required this.role,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        fullname: json["fullname"],
        profile: json["profile"],
        role: json["role"],
      );
}

LoginDoctorResp loginDoctorRespFromJson(String str) =>
    LoginDoctorResp.fromJson(json.decode(str));

class LoginDoctorResp {
  Doctor doctor;
  String accessToken;

  LoginDoctorResp({required this.doctor, required this.accessToken});

  factory LoginDoctorResp.fromJson(Map<String, dynamic> json) =>
      LoginDoctorResp(
        doctor: Doctor.fromJson(json["doctor"]),
        accessToken: json["accessToken"],
      );
}

class Doctor {
  String id;
  String fullname;
  String profile;
  String role;

  Doctor({
    required this.id,
    required this.fullname,
    required this.profile,
    required this.role,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        fullname: json["fullname"],
        profile: json["profile"],
        role: json["role"],
      );
}

/// GENERIC LOGIN ERROR RESPONSE
class LoginErrorResponse {
  bool error;
  int status;
  String message;
  String stack;

  LoginErrorResponse({
    required this.error,
    required this.status,
    required this.message,
    required this.stack,
  });

  factory LoginErrorResponse.fromJson(Map<String, dynamic> json) =>
      LoginErrorResponse(
        error: json["error"],
        status: json["status"],
        message: json["message"],
        stack: json["stack"],
      );
}
