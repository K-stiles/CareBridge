import 'dart:convert';

List<Doctor> doctorFromJson(String str) =>
    List<Doctor>.from(json.decode(str).map((x) => Doctor.fromJson(x)));

String doctorToJson(List<Doctor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Doctor {
  String id;
  String email;
  String fullname;
  String prn;
  String specializationId;
  int age;
  Gender gender;
  dynamic yoq;
  dynamic yor;
  dynamic qualification;
  String profile;
  Role role;
  bool isVerified;
  Terms terms;
  String? serviceId;
  DateTime createdAt;
  DateTime updatedAt;
  bool disabled;

  Doctor({
    required this.id,
    required this.email,
    required this.fullname,
    required this.prn,
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

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        prn: json["prn"],
        specializationId: json["specializationId"],
        age: json["age"],
        gender: genderValues.map[json["gender"]]!,
        yoq: json["yoq"],
        yor: json["yor"],
        qualification: json["qualification"],
        profile: json["profile"],
        role: roleValues.map[json["role"]]!,
        isVerified: json["isVerified"],
        terms: termsValues.map[json["terms"]]!,
        serviceId: json["serviceId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        disabled: json["disabled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullname": fullname,
        "prn": prn,
        "specializationId": specializationId,
        "age": age,
        "gender": genderValues.reverse[gender],
        "yoq": yoq,
        "yor": yor,
        "qualification": qualification,
        "profile": profile,
        "role": roleValues.reverse[role],
        "isVerified": isVerified,
        "terms": termsValues.reverse[terms],
        "serviceId": serviceId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "disabled": disabled,
      };
}

enum Gender { FEMALE, MALE, OTHER }

final genderValues = EnumValues(
    {"FEMALE": Gender.FEMALE, "MALE": Gender.MALE, "OTHER": Gender.OTHER});

enum Role { DOCTOR_600 }

final roleValues = EnumValues({"DOCTOR_600": Role.DOCTOR_600});

enum Terms { ACCEPTED }

final termsValues = EnumValues({"ACCEPTED": Terms.ACCEPTED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
