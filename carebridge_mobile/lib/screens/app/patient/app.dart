import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/screens/app/patient/doctors.dart';
import 'package:the_rock_mobile/screens/app/patient/history.dart';
import 'package:the_rock_mobile/screens/app/patient/home.dart';
import 'package:the_rock_mobile/screens/app/patient/learn.dart';
// import 'package:the_rock_mobile/providers/patient_provider.dart';
// import 'package:the_rock_mobile/screens/app/doctors.dart';
// import 'package:the_rock_mobile/screens/app/history.dart';
// import 'package:the_rock_mobile/screens/app/home.dart';
// import 'package:the_rock_mobile/screens/app/learn.dart';

class App extends StatefulWidget {
  static const String namedRoute = "/";
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // PatientProvider patientProvider =
    //     Provider.of<PatientProvider>(context, listen: false);
    // patientProvider.fetchPatient();
  }

  void navigateToSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  final List<Widget> _screens = const <Widget>[
    Home(),
    History(),
    Doctors(),
    Learn(),
  ];

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: navigateToSelected,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          items: [
            //home
            BottomNavigationBarItem(
              label: "Home",
              icon: SvgPicture.asset(
                AppImages.home,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.home_filled,
                fit: BoxFit.contain,
              ),
            ),

            // history
            BottomNavigationBarItem(
              label: "History",
              icon: SvgPicture.asset(
                AppImages.history,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.history_filled,
                fit: BoxFit.contain,
              ),
            ),

            // doctors
            BottomNavigationBarItem(
              label: "Doctors",
              icon: SvgPicture.asset(
                AppImages.doc,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.doc_filled,
                fit: BoxFit.contain,
              ),
            ),

            // learn
            BottomNavigationBarItem(
              label: "Learn",
              icon: SvgPicture.asset(
                AppImages.learn,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.learn_filled,
                fit: BoxFit.contain,
              ),
            ),
          ]),
    );
  }
}
