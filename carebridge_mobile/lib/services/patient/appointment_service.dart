import "dart:convert";
import "dart:io";
import "package:http/http.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:the_rock_mobile/constants/app_api.dart";
import "package:the_rock_mobile/constants/app_preference.dart";
import "package:the_rock_mobile/models/response/appointment_model.dart";
import "package:the_rock_mobile/models/response/payload_appointment.dart";

String token = "hbjdksbnkjfzdm";

final Map<String, String> _headers = {
  HttpHeaders.contentTypeHeader: "application/json",
  HttpHeaders.authorizationHeader: "Bearer $token",
};

class AppointmentService {
  static Client client = Client();

  /// GET ALL APPOINTMENTS [10 AT A TIME]
  static Future<List<Appointment>> fecthAppointments({
    String query = "page=1&pageSize=10",
  }) async {
    final url = Uri.parse(AppApi.baseAppointmentURL);
    final response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      return appointmentFromJson(response.body);
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to fetch Appointments data \n ${response.body}");
    }
  }

  /// GET AN APPOINTMENT BY ID
  static Future<Appointment> fecthAppointment(String appointmentId) async {
    final url = Uri.parse("${AppApi.baseAppointmentURL}/$appointmentId");
    final response = await client.get(url, headers: _headers);

    if (response.statusCode == 200) {
      return Appointment.fromJson(json.decode(response.body));
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to fetch appointment data \n ${response.body}");
    }
  }

  /// CREATE APPOINTMENT ACCOUNT
  static Future<bool> createAppointment(
      CreateAppointmentPayload payload) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? patientId = prefs.getString(AppPreference.authuserId);

    final url = Uri.parse("${AppApi.baseAppointmentURL}/$patientId");
    final appointmentBody = json.encode(payload.toJson());
    final response = await client.post(
      url,
      body: appointmentBody,
      headers: _headers,
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  /// UPDATE APPOINTMENT DATA
  static Future<Appointment> updateAppointment(
      String appointmentId, CreateAppointmentPayload payload) async {
    final url = Uri.parse(AppApi.baseAppointmentURL);
    final appointmentBody = json.encode(payload.toJson());

    final response =
        await client.put(url, body: appointmentBody, headers: _headers);

    if (response.statusCode == 200) {
      return Appointment.fromJson(json.decode(response.body));
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to update appointment data");
    }
  }

  /// DELETE/DISABLE APPOINTMENT ACCOUNT
  static Future<Appointment> deleteAppointment(String appointmentId) async {
    final url = Uri.parse("${AppApi.baseAppointmentURL}/$appointmentId");
    final response = await client.delete(url, headers: _headers);

    if (response.statusCode == 201) {
      return Appointment.fromJson(json.decode(response.body));
    } else {
      /// throw an Exception and catch it in the UI
      throw Exception("Failed to delete appointment data \n ${response.body}");
    }
  }
}
