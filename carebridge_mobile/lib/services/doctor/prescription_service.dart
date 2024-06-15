import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:the_rock_mobile/constants/app_api.dart';
import 'package:the_rock_mobile/models/requests/prescription_model.dart';
// import 'package:the_rock_mobile/models/prescription_model.dart';

String token = "hbjdksbnkjfzdm";

final Map<String, String> _headers = {
  HttpHeaders.contentTypeHeader: "application/json",
  HttpHeaders.authorizationHeader: "Bearer $token",
};

class PrescriptioService {
  Client client = Client();

  /// CREATE APPOINTMENT ACCOUNT
  Future<CreatePrescriptionResponse> createPrescription(
      CreatePrescriptionPayload payload) async {
    try {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final String? doctorId = prefs.getString('authUserId');

      final url = Uri.parse(AppApi.basePrescriptionsUrl);
      final prescriptionBody = json.encode(payload.toJson());
      final response =
          await client.post(url, body: prescriptionBody, headers: _headers);

      // print(response.body);

      if (response.statusCode == 201) {
        return CreatePrescriptionResponse.fromJson(json.decode(response.body));
      } else {
        /// throw an Exception and catch it in the UI
        throw Exception("Failed to create prescription \n ${response.body}");
      }
    } catch (e) {
      throw Exception("Something happend while creating prescription \n $e");
    }
  }
}
