import 'dart:convert';

import 'package:http/http.dart';
import 'package:the_rock_mobile/constants/app_api.dart';
import 'package:the_rock_mobile/models/requests/add_medicals.dart';

class MedicalService {
  static Client client = Client();

  static Future<bool> addMedicals(AddMedicalsPayload payload) async {
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    final medicalsBody = jsonEncode(payload.toJson());
    final url = Uri.parse(AppApi.baseMedicalsUrl);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: medicalsBody,
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // static Future<bool> updatePatientProfile(UpdateMedicalsPayload payload) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString(AppPreference.authtoken);
  //   String? patientId = prefs.getString(AppPreference.authuserId);

  //   Map<String, String> requestHeaders = {
  //     'Content-Type': 'application/json',
  //     'token': 'Bearer $token'
  //   };

  //   final updateBody = json.encode(payload.toJson());
  //   final url = Uri.parse("${AppApi.basePatientsURL}/$patientId");

  //   var response = await client.put(
  //     url,
  //     headers: requestHeaders,
  //     body: updateBody,
  //   );

  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
