import 'package:flutter/material.dart';
import 'package:the_rock_mobile/screens/auth/exports.dart';

class PatientLoginOrRegister extends StatefulWidget {
  static const String namedRoute = "/patient-login-or-register";

  const PatientLoginOrRegister({super.key});

  @override
  State<PatientLoginOrRegister> createState() => _PatientLoginOrRegisterState();
}

class _PatientLoginOrRegisterState extends State<PatientLoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(onTap: togglePages);
    } else {
      return PatientRegistration(onTap: togglePages);
    }
  }
}
