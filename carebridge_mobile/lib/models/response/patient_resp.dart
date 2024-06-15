import 'dart:convert';

GetPatientRes getPatientResFromJson(String str) =>
    GetPatientRes.fromJson(json.decode(str));

class GetPatientRes {
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

  GetPatientRes({
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

  factory GetPatientRes.fromJson(Map<String, dynamic> json) => GetPatientRes(
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
