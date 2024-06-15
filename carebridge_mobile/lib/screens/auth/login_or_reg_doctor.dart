import 'package:flutter/material.dart';
import 'package:the_rock_mobile/screens/auth/login_doc.dart';
import 'package:the_rock_mobile/screens/auth/reg_doctor.dart';

class DoctorLoginOrRegister extends StatefulWidget {
  static const String namedRoute = "/doctor-login-or-register";

  const DoctorLoginOrRegister({super.key});

  @override
  State<DoctorLoginOrRegister> createState() => _DoctorLoginOrRegisterState();
}

class _DoctorLoginOrRegisterState extends State<DoctorLoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginDocotor(onTap: togglePages);
    } else {
      return RegisterDoctor(onTap: togglePages);
    }
  }
}
