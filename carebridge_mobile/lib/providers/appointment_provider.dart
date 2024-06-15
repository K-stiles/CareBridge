import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:the_rock_mobile/constants/exports.dart';
import 'package:the_rock_mobile/models/response/payload_appointment.dart';
import 'package:the_rock_mobile/screens/app/patient/app.dart';
import 'package:the_rock_mobile/services/patient/appointment_service.dart';

class AppointmentNotifier extends ChangeNotifier {
  bool _processing = false;

  bool get processing => _processing;

  createAppointment(CreateAppointmentPayload payload) {
    _processing = true;
    notifyListeners();
    AppointmentService.createAppointment(payload).then((response) {
      _processing = false;
      notifyListeners();
      if (response) {
        Get.defaultDialog(
          title: 'Submitted',
          titlePadding: const EdgeInsets.all(20),
          contentPadding: const EdgeInsets.all(20),
          content: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  height: 80,
                  AppImages.card_pos,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                Text(
                  "Your appointment has been successfully submitted. Keep an eye on your notifications for Doctor availability confirmation.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade700),
                )
              ],
            ),
          ),
          barrierDismissible: false,
          confirm: ElevatedButton(
            onPressed: () => Get.offAll(() => const App()),
            child: const Text('OK'),
          ),
        );
      } else if (!response) {
        Get.snackbar("Ooops", "Appointment booking failedd",
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
