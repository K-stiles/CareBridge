import 'package:flutter/material.dart';
import 'package:the_rock_mobile/models/response/doctor_resp.dart';
import 'package:the_rock_mobile/models/response/patient_resp.dart';
import 'package:the_rock_mobile/services/helpers/auth_helper.dart';

class ProfileNotifier extends ChangeNotifier {
  bool _processing = false;

  bool get processing => _processing;

  GetPatientRes? patientProfile;
  GetDoctorRes? doctorProfile;

  getPatientProfile() async {
    _processing = true;
    notifyListeners();
    patientProfile = await AuthHelper.getPatientProfile();
    _processing = false;
    notifyListeners();
  }

  getDoctorProfile() async {
    _processing = true;
    notifyListeners();
    doctorProfile = await AuthHelper.getDoctorProfile();
    _processing = false;
    notifyListeners();
  }
}
