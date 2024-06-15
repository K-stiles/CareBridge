/// RESP
class UpdatePatientResp {
  String id;
  String email;
  String fullname;
  dynamic phone;
  int age;
  String gender;
  String profile;
  String role;
  bool isVerified;
  String terms;
  dynamic medicalInfoId;
  DateTime createdAt;
  DateTime updatedAt;
  bool disabled;

  UpdatePatientResp({
    required this.id,
    required this.email,
    required this.fullname,
    required this.phone,
    required this.age,
    required this.gender,
    required this.profile,
    required this.role,
    required this.isVerified,
    required this.terms,
    required this.medicalInfoId,
    required this.createdAt,
    required this.updatedAt,
    required this.disabled,
  });

  factory UpdatePatientResp.fromJson(Map<String, dynamic> json) =>
      UpdatePatientResp(
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

/// PAYLOAD
class UpdateDoctorPayload {
  String id;
  String email;
  String fullname;
  String specializationId;
  int age;
  String gender;
  dynamic yoq;
  dynamic yor;
  dynamic qualification;
  String profile;
  String role;
  bool isVerified;
  String terms;
  dynamic serviceId;
  DateTime createdAt;
  DateTime updatedAt;
  bool disabled;

  UpdateDoctorPayload({
    required this.id,
    required this.email,
    required this.fullname,
    required this.specializationId,
    required this.age,
    required this.gender,
    required this.yoq,
    required this.yor,
    required this.qualification,
    required this.profile,
    required this.role,
    required this.isVerified,
    required this.terms,
    required this.serviceId,
    required this.createdAt,
    required this.updatedAt,
    required this.disabled,
  });

  factory UpdateDoctorPayload.fromJson(Map<String, dynamic> json) =>
      UpdateDoctorPayload(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        specializationId: json["specializationId"],
        age: json["age"],
        gender: json["gender"],
        yoq: json["yoq"],
        yor: json["yor"],
        qualification: json["qualification"],
        profile: json["profile"],
        role: json["role"],
        isVerified: json["isVerified"],
        terms: json["terms"],
        serviceId: json["serviceId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        disabled: json["disabled"],
      );
}
