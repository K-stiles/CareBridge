/// PATIENT
class LoginPatientPayload {
  String email;
  String password;

  LoginPatientPayload({required this.email, required this.password});
  Map<String, dynamic> toJson() => {"email": email, "password": password};
}

class RegPatientPayload {
  String fullname;
  String email;
  String password;
  String terms;
  String? gender;

  RegPatientPayload({
    required this.fullname,
    required this.email,
    required this.password,
    required this.terms,
    this.gender,
  });

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "email": email,
        "password": password,
        "gender": gender,
        "terms": terms,
      };
}

///DOCTOR
class LoginDoctorPayload {
  String email;
  String prn;

  LoginDoctorPayload({required this.email, required this.prn});
  Map<String, dynamic> toJson() => {"email": email, "prn": prn};
}

class RegDoctorPayload {
  String email;
  String prn;
  String fullname;
  String profile;
  String gender;
  String terms;
  String specializationId;

  RegDoctorPayload({
    required this.email,
    required this.prn,
    required this.fullname,
    required this.profile,
    required this.gender,
    required this.terms,
    required this.specializationId,
  });

  factory RegDoctorPayload.fromJson(Map<String, dynamic> json) =>
      RegDoctorPayload(
        email: json["email"],
        prn: json["prn"],
        fullname: json["fullname"],
        profile: json["profile"],
        gender: json["gender"],
        terms: json["terms"],
        specializationId: json["specializationId"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "prn": prn,
        "fullname": fullname,
        "profile": profile,
        "gender": gender,
        "terms": terms,
        "specializationId": specializationId,
      };
}
