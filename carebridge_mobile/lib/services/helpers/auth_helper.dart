import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/constants/app_api.dart';
import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/constants/current_user.dart';
import 'package:the_rock_mobile/models/requests/auth/update_payload.dart';
import 'package:the_rock_mobile/models/requests/exports.dart';
import 'package:the_rock_mobile/models/response/auth/login_resp.dart';
import 'package:the_rock_mobile/models/response/auth/reg_resp.dart';
import 'package:the_rock_mobile/models/response/doctor_resp.dart';
import 'package:the_rock_mobile/models/response/patient_resp.dart';
import 'package:the_rock_mobile/utility/parse_auth_userid.dart';

class AuthHelper {
  static Client client = Client();

  /// PATIENT AUTHENTICATION
  static Future<bool> loginPatient(LoginPatientPayload payload) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    final loginBody = json.encode(payload.toJson());

    final url = Uri.parse(AppApi.patientloginURL);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: loginBody,
    );

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String token =
          LoginPatientResp.fromJson(jsonDecode(response.body)).accessToken;
      String userId =
          LoginPatientResp.fromJson(jsonDecode(response.body)).patient.id;
      String profile =
          LoginPatientResp.fromJson(jsonDecode(response.body)).patient.profile;
      String fullname =
          LoginPatientResp.fromJson(jsonDecode(response.body)).patient.fullname;
      String callerId = parseAuthUserId(userId);

      await prefs.setString(AppPreference.authtoken, token);
      await prefs.setString(AppPreference.authuserId, userId);
      await prefs.setString(AppPreference.authprofile, profile);
      await prefs.setString(AppPreference.callerId, callerId);
      await prefs.setString(AppPreference.callername, fullname);
      await prefs.setBool(AppPreference.isPatient, true);
      await prefs.setBool(AppPreference.loggedIn, true);

      currentUser.id = callerId;
      currentUser.name = fullname;

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> registerPatient(RegPatientPayload payload) async {
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    final registrationBody = jsonEncode(payload.toJson());
    final url = Uri.parse(AppApi.patientRegisterURL);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: registrationBody,
    );

    if (response.statusCode == 201) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // String token =
      //     RegPatientResp.fromJson(jsonDecode(response.body)).accessToken;
      String userId =
          RegPatientResp.fromJson(jsonDecode(response.body)).patient.id;
      String profile =
          RegPatientResp.fromJson(jsonDecode(response.body)).patient.profile;

      //  await prefs.setString(AppPreference.authtoken, token);
      await prefs.setString(AppPreference.authuserId, userId);
      await prefs.setString(AppPreference.authprofile, profile);
      await prefs.setBool(AppPreference.isPatient, true);
      await prefs.setBool(AppPreference.loggedIn, true);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updatePatientProfile(UpdatePatientPayload payload) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(AppPreference.authtoken);
    String? patientId = prefs.getString(AppPreference.authuserId);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    final updateBody = json.encode(payload.toJson());
    final url = Uri.parse("${AppApi.basePatientsURL}/$patientId");

    var response = await client.put(
      url,
      headers: requestHeaders,
      body: updateBody,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<GetPatientRes> getPatientProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(AppPreference.authtoken);
    String? patientId = prefs.getString(AppPreference.authuserId);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    final url = Uri.parse("${AppApi.basePatientsURL}/$patientId");
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      GetPatientRes profile = getPatientResFromJson(response.body);
      return profile;
    } else {
      throw Exception("Failed to get patient profile data");
    }
  }

  /// DOCTOR AUTHENTICATION
  static Future<bool> loginDoctor(LoginDoctorPayload payload) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    final loginBody = json.encode(payload.toJson());

    final url = Uri.parse(AppApi.doctorloginURL);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: loginBody,
    );

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      String token =
          LoginDoctorResp.fromJson(jsonDecode(response.body)).accessToken;
      String userId =
          LoginDoctorResp.fromJson(jsonDecode(response.body)).doctor.id;
      String profile =
          LoginDoctorResp.fromJson(jsonDecode(response.body)).doctor.profile;
      String fullname =
          LoginDoctorResp.fromJson(jsonDecode(response.body)).doctor.fullname;
      String callerId = parseAuthUserId(userId);
      // String callerId = replaceDashesWithUnderscores("70119345678"); //611193

      await prefs.setString(AppPreference.authtoken, token);
      await prefs.setString(AppPreference.authuserId, userId);
      await prefs.setString(AppPreference.authprofile, profile);
      await prefs.setString(AppPreference.callerId, callerId);
      await prefs.setString(AppPreference.callername, fullname);
      await prefs.setBool(AppPreference.isPatient, false);
      await prefs.setBool(AppPreference.loggedIn, true);

      currentUser.id = callerId;
      currentUser.name = fullname;

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> registerDoctor(RegDoctorPayload payload) async {
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    final registrationBody = jsonEncode(payload.toJson());
    final url = Uri.parse(AppApi.doctorRegisterURL);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: registrationBody,
    );

    if (response.statusCode == 201) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // String token =
      //     RegDoctorResp.fromJson(jsonDecode(response.body)).accessToken;
      String userId =
          RegDoctorResp.fromJson(jsonDecode(response.body)).doctor.id;
      String profile =
          RegDoctorResp.fromJson(jsonDecode(response.body)).doctor.profile;

      //  await prefs.setString(AppPreference.authtoken, token);
      await prefs.setString(AppPreference.authuserId, userId);
      await prefs.setString(AppPreference.authprofile, profile);
      await prefs.setBool(AppPreference.isPatient, false);
      await prefs.setBool(AppPreference.loggedIn, true);

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateDoctorInfo(UpdateDoctorPayload payload) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(AppPreference.authtoken);
    String? doctorId = prefs.getString(AppPreference.authuserId);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    final updateBody = json.encode(payload.toJson());
    final url = Uri.parse("${AppApi.baseDocotorsURL}/$doctorId");

    var response = await client.put(
      url,
      headers: requestHeaders,
      body: updateBody,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<GetDoctorRes> getDoctorProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(AppPreference.authtoken);
    String? doctorId = prefs.getString(AppPreference.authuserId);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    final url = Uri.parse("${AppApi.baseDocotorsURL}/$doctorId");
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var profile = getDoctorResFromJson(response.body);
      return profile;
    } else {
      throw Exception("Failed to get the profile");
    }
  }
}
