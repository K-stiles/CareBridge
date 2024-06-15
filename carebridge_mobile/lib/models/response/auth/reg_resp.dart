class RegDoctorResp {
  bool succcess;
  String message;
  Doctor doctor;

  RegDoctorResp({
    required this.succcess,
    required this.message,
    required this.doctor,
  });

  factory RegDoctorResp.fromJson(Map<String, dynamic> json) => RegDoctorResp(
        succcess: json["succcess"],
        message: json["message"],
        doctor: Doctor.fromJson(json["doctor"]),
      );
}

class Doctor {
  String id;
  String email;
  String fullname;
  String profile;
  String role;

  Doctor({
    required this.id,
    required this.email,
    required this.fullname,
    required this.profile,
    required this.role,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        profile: json["profile"],
        role: json["role"],
      );
}

class RegPatientResp {
  bool succcess;
  String message;
  Patient patient;

  RegPatientResp({
    required this.succcess,
    required this.message,
    required this.patient,
  });

  factory RegPatientResp.fromJson(Map<String, dynamic> json) => RegPatientResp(
        succcess: json["succcess"],
        message: json["message"],
        patient: Patient.fromJson(json["patient"]),
      );
}

class Patient {
  String id;
  String email;
  String fullname;
  String profile;
  String role;

  Patient({
    required this.id,
    required this.email,
    required this.fullname,
    required this.profile,
    required this.role,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        profile: json["profile"],
        role: json["role"],
      );
}
