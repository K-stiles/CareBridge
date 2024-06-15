import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:the_rock_mobile/models/requests/add_medicals.dart';
import 'package:the_rock_mobile/screens/app/patient/app.dart';
import 'package:the_rock_mobile/screens/auth/login_or_reg_patient.dart';
import 'package:the_rock_mobile/services/patient/medical_service.dart';

class MedicalsNotifier extends ChangeNotifier {
  bool _processing = false;

  bool get processing => _processing;

  set processing(bool newValue) {
    _processing = newValue;
    notifyListeners();
  }

  addMedicals(AddMedicalsPayload payload) async {
    MedicalService.addMedicals(payload).then((response) {
      if (response) {
        Get.defaultDialog(
          title: 'Saved Successfully',
          titlePadding: const EdgeInsets.all(20),
          contentPadding: const EdgeInsets.all(20),
          content: const Center(
            child: Column(
              children: [
                Icon(
                  FluentIcons.accessibility_checkmark_48_regular,
                  size: 60,
                  color: Colors.green,
                ),
                SizedBox(height: 16),
                Text(
                  'Your medical information has been successfully saved',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          confirm: ElevatedButton(
              onPressed: () {
                Get.offAll(
                    () => const App());
              },
              child: const Text('OK')),
          barrierDismissible: false,
        );
      } else {
        Get.snackbar("Adding Medicals Failed", "Please try again",
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
