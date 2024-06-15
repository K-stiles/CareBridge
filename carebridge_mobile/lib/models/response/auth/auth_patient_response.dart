// import 'dart:convert';

// List<Patient> patientFromJson(String str) =>
//     List<Patient>.from(json.decode(str).map((x) => Patient.fromJson(x)));

// class PatientLoginResponse {
//   bool succcess;
//   Patient patient;
//   Session session;
//   String accessToken;
//   String refreshToken;

//   PatientLoginResponse({
//     required this.succcess,
//     required this.patient,
//     required this.session,
//     required this.accessToken,
//     required this.refreshToken,
//   });

//   factory PatientLoginResponse.fromJson(Map<String, dynamic> json) =>
//       PatientLoginResponse(
//         succcess: json["succcess"],
//         patient: Patient.fromJson(json["patient"]),
//         session: Session.fromJson(json["session"]),
//         accessToken: json["accessToken"],
//         refreshToken: json["refreshToken"],
//       );
// }

// class PatientRegResponse {
//   bool succcess;
//   String message;
//   Patient patient;

//   PatientRegResponse({
//     required this.succcess,
//     required this.message,
//     required this.patient,
//   });

//   factory PatientRegResponse.fromJson(Map<String, dynamic> json) =>
//       PatientRegResponse(
//         succcess: json["succcess"],
//         message: json["message"],
//         patient: Patient.fromJson(json["patient"]),
//       );
// }

// class Session {
//   String id;
//   bool valid;
//   String userAgent;
//   dynamic doctorId;
//   String patientId;
//   dynamic adminId;
//   bool removed;

//   Session({
//     required this.id,
//     required this.valid,
//     required this.userAgent,
//     required this.doctorId,
//     required this.patientId,
//     required this.adminId,
//     required this.removed,
//   });

//   factory Session.fromJson(Map<String, dynamic> json) => Session(
//         id: json["id"],
//         valid: json["valid"],
//         userAgent: json["userAgent"],
//         doctorId: json["doctorId"],
//         patientId: json["patientId"],
//         adminId: json["adminId"],
//         removed: json["removed"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "valid": valid,
//         "userAgent": userAgent,
//         "doctorId": doctorId,
//         "patientId": patientId,
//         "adminId": adminId,
//         "removed": removed,
//       };
// }

// class LoginErrorResponse {
//   bool error;
//   int status;
//   String message;
//   String stack;

//   LoginErrorResponse({
//     required this.error,
//     required this.status,
//     required this.message,
//     required this.stack,
//   });

//   factory LoginErrorResponse.fromJson(Map<String, dynamic> json) =>
//       LoginErrorResponse(
//         error: json["error"],
//         status: json["status"],
//         message: json["message"],
//         stack: json["stack"],
//       );
// }

class Patient {
  String id;
  String email;
  String fullname;
  dynamic phone;
  int? age;
  String? gender;
  String profile;
  String? role;
  bool? isVerified;
  String? terms;
  dynamic medicalInfoId;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? disabled;

  Patient({
    required this.id,
    required this.email,
    required this.fullname,
    required this.profile,
    this.phone,
    this.age,
    this.gender,
    this.role,
    this.isVerified,
    this.terms,
    this.medicalInfoId,
    this.createdAt,
    this.updatedAt,
    this.disabled,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        phone: json["phone"],
        age: json["age"],
        gender: json["gender"],
        profile: json["profile"],
        role: json["role"],
        isVerified: json["isVerified"],
        terms: json["terms"],
        medicalInfoId: json["medicalInfoId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        disabled: json["disabled"],
      );
}

/// GENERIC LOGIN ERROR RESPONSE
List<Patient> patients = [
  Patient(
      id: "edsxmzfklds",
      email: "fil@gmail.com",
      fullname: "Felicia Gunn",
      profile:
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=3276&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
  Patient(
    id: "djksnvkdjklz",
    email: "phil@gmail.com",
    fullname: "Phil Danso",
    profile:
        "https://images.unsplash.com/photo-1695653422279-8a8a52ccb3cc?auto=format&fit=crop&q=80&w=3272&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Patient(
    id: "bdshjknz",
    email: "james@gmail.com",
    fullname: "James Kent",
    profile:
        "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?auto=format&fit=crop&q=80&w=2662&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Patient(
    id: "ewjndsaiokjl;z",
    email: "sarah@gmail.com",
    fullname: "Sarah Knot",
    profile:
        "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&q=80&w=3387&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Patient(
    id: "iefjosdkml;x,c",
    email: "eric@gmail.com",
    fullname: "Eric Agyenkwa",
    profile:
        "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?auto=format&fit=crop&q=80&w=3332&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Patient(
    id: "oijuhgfds",
    email: "danny@gmail.com",
    fullname: "Daniel Agyie",
    profile:
        "https://images.unsplash.com/photo-1506634572416-48cdfe530110?auto=format&fit=crop&q=80&w=3264&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Patient(
    id: "mnnbvcxz",
    email: "mike@gmail.com",
    fullname: "Agnes Gunn",
    profile:
        "https://plus.unsplash.com/premium_photo-1697753961700-19a28f2add42?auto=format&fit=crop&q=80&w=3270&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Patient(
    id: "oijhgvcx;z",
    email: "ama@gmail.com",
    fullname: "Ama GmAppiahail",
    profile:
        "https://images.unsplash.com/photo-1533992931871-28f779bc0675?auto=format&fit=crop&q=80&w=3270&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
];
