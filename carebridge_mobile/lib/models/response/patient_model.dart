import 'dart:convert';

List<PatientModel> patientModelFromJson(String str) => List<PatientModel>.from(
    json.decode(str).map((x) => PatientModel.fromJson(x)));

String patientModelToJson(List<PatientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientModel {
  String id;
  String email;
  String fullname;
  String password;
  dynamic phone;
  int age;
  Gender gender;
  String profile;
  Role role;
  bool isVerified;
  Terms terms;
  String? medicalInfoId;
  DateTime createdAt;
  DateTime updatedAt;
  bool disabled;

  PatientModel({
    required this.id,
    required this.email,
    required this.fullname,
    required this.password,
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

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        password: json["password"],
        phone: json["phone"],
        age: json["age"],
        gender: genderValues.map[json["gender"]]!,
        profile: json["profile"],
        role: roleValues.map[json["role"]]!,
        isVerified: json["isVerified"],
        terms: termsValues.map[json["terms"]]!,
        medicalInfoId: json["medicalInfoId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        disabled: json["disabled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullname": fullname,
        "password": password,
        "phone": phone,
        "age": age,
        "gender": genderValues.reverse[gender],
        "profile": profile,
        "role": roleValues.reverse[role],
        "isVerified": isVerified,
        "terms": termsValues.reverse[terms],
        "medicalInfoId": medicalInfoId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "disabled": disabled,
      };
}

enum Gender { FEMALE, MALE, OTHER }

final genderValues = EnumValues(
    {"FEMALE": Gender.FEMALE, "MALE": Gender.MALE, "OTHER": Gender.OTHER});

enum Role { PATIENT_200 }

final roleValues = EnumValues({"PATIENT_200": Role.PATIENT_200});

enum Terms { ACCEPTED, DECLINED }

final termsValues =
    EnumValues({"ACCEPTED": Terms.ACCEPTED, "DECLINED": Terms.DECLINED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
