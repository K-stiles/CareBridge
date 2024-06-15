import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/screens/auth/exports.dart';
import 'package:the_rock_mobile/screens/auth/login_or_reg_doctor.dart';

class GettingStarted extends StatelessWidget {
  static const String namedRoute = "/getting-started";
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    void patientAuth() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppPreference.entryPoint, true);
      Get.to(() => const PatientLoginOrRegister());
    }

    void doctorAuth() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppPreference.entryPoint, true);
      Get.to(() => const DoctorLoginOrRegister());
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                //text
                const Heading(
                  text: "Effective , Affordable and Convenient health care",
                ),

                const Spacer(),

                //image
                Image.asset("assets/images/getting_started.png", height: 300),

                const Spacer(),

                //button
                AuthButton(onTap: patientAuth, text: "Sign in as a Patient"),

                const SizedBox(height: 10),

                //button
                AuthButton(
                  onTap: doctorAuth,
                  text: "Sign in as a Health Practitioner",
                  outline: true,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
