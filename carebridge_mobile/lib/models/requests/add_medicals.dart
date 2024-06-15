import 'dart:convert';

String addMedicalsPayloadToJson(AddMedicalsPayload data) =>
    json.encode(data.toJson());

class AddMedicalsPayload {
  String patientId;
  double height;
  double weight;
  String dateOfBirth;
  String location;
  bool chronicDiseaseStatus;
  String chronicDiseaseInfo;
  bool allergiesStatus;
  String allergiesInfo;
  bool medicalConditionStatus;
  String medicalConditionInfo;

  AddMedicalsPayload({
    required this.patientId,
    required this.height,
    required this.weight,
    required this.dateOfBirth,
    required this.location,
    required this.chronicDiseaseStatus,
    required this.chronicDiseaseInfo,
    required this.allergiesStatus,
    required this.allergiesInfo,
    required this.medicalConditionStatus,
    required this.medicalConditionInfo,
  });

  Map<String, dynamic> toJson() => {
        "patientId": patientId,
        "height": height,
        "weight": weight,
        "dateOfBirth": dateOfBirth,
        "location": location,
        "chronicDiseaseStatus": chronicDiseaseStatus,
        "chronicDiseaseInfo": chronicDiseaseInfo,
        "allergiesStatus": allergiesStatus,
        "allergiesInfo": allergiesInfo,
        "medicalConditionStatus": medicalConditionStatus,
        "medicalConditionInfo": medicalConditionInfo,
      };
}
