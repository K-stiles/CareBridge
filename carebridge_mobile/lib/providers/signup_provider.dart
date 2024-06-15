import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_rock_mobile/controllers/call_helper.dart';
import 'package:the_rock_mobile/models/requests/auth/auth_payload.dart';
import 'package:the_rock_mobile/screens/app/doctor/doc_app.dart';
import 'package:the_rock_mobile/screens/auth/browse_packages.dart';
import 'package:the_rock_mobile/services/helpers/auth_helper.dart';

class SignUpNotifier extends ChangeNotifier {
  bool _processing = false;

  bool get processing => _processing;

  set processing(bool newValue) {
    _processing = newValue;
    notifyListeners();
  }

  registerPatient(RegPatientPayload payload) {
    _processing = true;
    notifyListeners();
    AuthHelper.registerPatient(payload).then((response) {
      _processing = false;
      notifyListeners();
      if (response) {
        Get.snackbar("Welcome to Purple Care Mobile",
            "An email has been sent to you. Please verify your email.",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.shield_checkmark_16_regular,
              color: Colors.white,
            ));

        /// zego
        onUserLogin();

        Future.delayed(const Duration(seconds: 3)).then((value) {
          Get.off(() => const BrowsePackages());
        });
      } else if (!response) {
        Get.snackbar(
            "Registration Failed", "Please Check your internet connection",
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

  /// DOCTOR AUTHENTICATION
  registerDoctor(RegDoctorPayload payload) {
    _processing = true;
    notifyListeners();
    AuthHelper.registerDoctor(payload).then((response) {
      _processing = false;
      notifyListeners();
      if (response) {
        Get.snackbar("Welcome to Purple Care Mobile",
            "An email has been sent to you. Please verify your email.",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.shield_checkmark_16_regular,
              color: Colors.white,
            ));

        /// zego
        onUserLogin();

        Future.delayed(const Duration(seconds: 3)).then((value) {
          Get.off(() => const Docapp());
        });
      } else if (!response) {
        Get.snackbar(
            "Registration Failed", "Please Check your internet connection",
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
