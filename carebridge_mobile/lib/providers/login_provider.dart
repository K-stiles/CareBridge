import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/controllers/call_helper.dart';
import 'package:the_rock_mobile/models/requests/auth/update_payload.dart';
import 'package:the_rock_mobile/models/requests/exports.dart';
import 'package:the_rock_mobile/screens/app/doctor/doc_app.dart';
import 'package:the_rock_mobile/screens/app/patient/app.dart';
import 'package:the_rock_mobile/services/helpers/auth_helper.dart';

class LoginNotifier extends ChangeNotifier {
  bool _processing = false;

  bool get processing => _processing;

  set processing(bool newValue) {
    _processing = newValue;
    notifyListeners();
  }

  bool? _entrypoint;
  bool get entrypoint => _entrypoint ?? false;

  set entrypoint(bool newState) {
    _entrypoint = newState;
    notifyListeners();
  }

  bool? _isPatient;
  bool get isPatient => _isPatient ?? false;

  set isPatient(bool newState) {
    _isPatient = newState;
    notifyListeners();
  }

  bool? _loggedIn;
  bool get loggedIn => _loggedIn ?? false;

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();
  }

  getAuthPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    entrypoint = prefs.getBool(AppPreference.entryPoint) ?? false;
    loggedIn = prefs.getBool(AppPreference.loggedIn) ?? false;
    isPatient = prefs.getBool(AppPreference.isPatient) ?? false;
  }

  loginPatient(LoginPatientPayload payload) {
    _processing = true;
    notifyListeners();
    AuthHelper.loginPatient(payload).then((response) {
      _processing = false;
      notifyListeners();
      if (response) {
        /// zego
        onUserLogin();

        Get.off(() => const App());
      } else if (!response) {
        Get.snackbar("Login Failed", "Please Check your credentials",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }
    });
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    onUserLogout();

    await prefs.setBool(AppPreference.loggedIn, false);
    await prefs.setBool(AppPreference.isPatient, false);

    await prefs.remove(AppPreference.authtoken);
    await prefs.remove(AppPreference.authuserId);
    await prefs.remove(AppPreference.authprofile);
    await prefs.remove(AppPreference.callerId);
    await prefs.remove(AppPreference.callername);
  }

  updatePatientInfo(UpdatePatientPayload payload) async {
    _processing = true;
    notifyListeners();
    AuthHelper.updatePatientProfile(payload).then((response) {
      _processing = false;
      notifyListeners();
      if (response) {
        Get.snackbar("Profile Updated", "Enjoy the application",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.shield_checkmark_16_regular,
              color: Colors.white,
            ));

        Future.delayed(const Duration(seconds: 3)).then((value) {
          Get.offAll(() => const App());
        });
      } else {
        Get.snackbar("Updating Failed", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }
    });
  }

  /// DOCTOR AUTH
  loginDoctor(LoginDoctorPayload payload) {
    _processing = true;
    notifyListeners();
    AuthHelper.loginDoctor(payload).then((response) {
      _processing = false;
      notifyListeners();
      if (response) {
        /// zego
        onUserLogin();

        Get.off(() => const Docapp());
      } else if (!response) {
        Get.snackbar(
          "Login Failed",
          "Please Check your credentials",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
          icon: const Icon(
            FluentIcons.warning_12_filled,
            color: Colors.white,
          ),
        );
      }
    });
  }

  updateDoctorInfo(UpdateDoctorPayload payload) async {
    _processing = true;
    notifyListeners();
    AuthHelper.updateDoctorInfo(payload).then((response) {
      _processing = false;
      notifyListeners();
      if (response) {
        Get.snackbar("Profile Updated", "Enjoy the application",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.shield_checkmark_16_regular,
              color: Colors.white,
            ));

        Future.delayed(const Duration(seconds: 3)).then((value) {
          Get.offAll(() => const Docapp());
        });
      } else {
        Get.snackbar("Updating Failed", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }
    });
  }
}
