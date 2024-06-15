import "dart:convert";
import "dart:io";
import "package:http/http.dart";
import "package:the_rock_mobile/constants/app_api.dart";
// import "package:the_rock_mobile/models/patient_model.dart";
// import 'package:the_rock_mobile/models/auth_patient_response.dart';
import "package:shared_preferences/shared_preferences.dart";
import "package:the_rock_mobile/models/response/auth/auth_patient_response.dart";
import "package:the_rock_mobile/models/response/patient_model.dart";

const String token = ""; // from local storage

final Map<String, String> _headers = {
  "Authourization": "Bearer $token",
  HttpHeaders.contentTypeHeader: "application/json",
};

class PatientService {
  Client client = Client();

  /// GET ALL PATIENTS
  Future<List<PatientModel>> fecthPatients(String query) async {
    final url = Uri.parse(AppApi.basePatientsURL);
    final response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      return patientModelFromJson(response.body);
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to fetch patient data");
    }
  }

  /// GET  PATIENT BY ID
  Future<Patient> getPatient() async {
    Map<String, String> headers = {"Content-Type": "application/json"};

    /// get patient id
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? patientId = prefs.getString('authUserId');
    // var authp = await PatientPreferences.getAuthenticatedPatient();
    // String? patientId = authp.authUserId;
    // print("patientId: ${authp.authUserId}");

    try {
      final url = Uri.parse("${AppApi.basePatientsURL}/$patientId");
      final response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return Patient.fromJson(json);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  /// UPDATE PATIENT DATA
  Future<Patient> updatePatientAccount(
      String patientId, Patient payload) async {
    final url = Uri.parse("${AppApi.baseURL}/patients/$patientId");
    final patientBody = json.encode(payload);
    final response =
        await client.put(url, body: patientBody, headers: _headers);

    if (response.statusCode == 201) {
      return Patient.fromJson(json.decode(response.body));
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to fetch patient data");
    }
  }

  /// DELETE/DISABLE PATIENT ACCOUNT
  Future<Patient> deletePatientAccount(String patientId) async {
    final url = Uri.parse("${AppApi.baseURL}/patients/$patientId");
    final response = await client.delete(url, headers: _headers);

    if (response.statusCode == 201) {
      return Patient.fromJson(json.decode(response.body));
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to fetch patient data");
    }
  }
}
