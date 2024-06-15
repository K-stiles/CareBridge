import 'dart:convert';

GetDoctorRes getDoctorResFromJson(String str) =>
    GetDoctorRes.fromJson(json.decode(str));

String getDoctorResToJson(GetDoctorRes data) => json.encode(data.toJson());

class GetDoctorRes {
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

  GetDoctorRes({
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

  factory GetDoctorRes.fromJson(Map<String, dynamic> json) => GetDoctorRes(
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullname": fullname,
        "specializationId": specializationId,
        "age": age,
        "gender": gender,
        "yoq": yoq,
        "yor": yor,
        "qualification": qualification,
        "profile": profile,
        "role": role,
        "isVerified": isVerified,
        "terms": terms,
        "serviceId": serviceId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "disabled": disabled,
      };
}
