import "dart:convert";
import "dart:io";
import "package:http/http.dart";
import "package:the_rock_mobile/constants/app_api.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:the_rock_mobile/constants/app_preference.dart";
import "package:the_rock_mobile/models/doctor_model.dart";

String token = "hbjdksbnkjfzdm";
final Map<String, String> _headers = {
  HttpHeaders.authorizationHeader: "Bearer $token",
  HttpHeaders.contentTypeHeader: "application/json",
};

class DoctorService {
  Client client = Client();

  /// GET ALL DOCTORS
  Future<List<Doctor>> fecthDoctors({
    String query = "page=1&pageSize=10&sort=fullname&order=asc",
  }) async {
    try {
      final url = Uri.parse("${AppApi.baseDocotorsURL}?$query");
      final response = await client.get(url, headers: _headers);

      if (response.statusCode == 200) {
        return doctorFromJson(response.body);
      } else {
        throw Exception("Failed to fetch doctor data \n ${response.body}");
      }
    } catch (e) {
      throw Exception(
          "Error: Something happend while fetcing the data \n ${e.toString()}");
    }
  }

  /// GET DOCTOR BY ID
  // Future<DoctorRes> fecthDoctor() async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String? doctorId = prefs.getString(AppP);

  //     final url = Uri.parse("${AppApi.baseDocotorsURL}/$doctorId");
  //     final response = await client.get(url, headers: _headers);

  //     if (response.statusCode == 200) {
  //       return DoctorRes.fromJson(json.decode(response.body));
  //     } else {
  //       /// throw an Exception and catch it in the UI
  //       throw Exception("Failed to fetch doctor data \n ${response.body}");
  //     }
  //   } catch (e) {
  //     /// throw an Exception and catch it in the UI
  //     throw Exception(
  //         "Error: Something happend while fetcing the data \n ${e.toString()}");
  //   }
  // }

  /// UPDATE DOCTOR DATA
  Future<Doctor> updateDoctorAccount(Doctor payload) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? doctorId = prefs.getString(AppPreference.authuserId);

    final url = Uri.parse("${AppApi.baseURL}/doctors/$doctorId");
    final doctorBody = json.encode(payload.toJson());
    final response = await client.put(url, body: doctorBody, headers: _headers);

    if (response.statusCode == 200) {
      return Doctor.fromJson(json.decode(response.body));
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to fetch doctor data \n ${response.body}");
    }
  }

  /// DELETE/DISABLE DOCTOR ACCOUNT
  Future<Doctor> deleteDoctorAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? doctorId = prefs.getString(AppPreference.authuserId);

    final url = Uri.parse("${AppApi.baseURL}/doctors/$doctorId");
    final response = await client.delete(url, headers: _headers);

    if (response.statusCode == 200) {
      return Doctor.fromJson(json.decode(response.body));
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to fetch doctor data \n ${response.body}");
    }
  }
}
