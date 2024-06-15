import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/screens/app/doctor/doc_chats.dart';
import 'package:the_rock_mobile/screens/app/doctor/doc_more.dart';
import 'package:the_rock_mobile/screens/app/doctor/screen_appointments.dart';

class Docapp extends StatefulWidget {
  static const String namedRoute = "/doc-app";
  const Docapp({super.key});

  @override
  State<Docapp> createState() => _DocappState();
}

class _DocappState extends State<Docapp> {
  int _selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // Provider.of<DoctorProvider>(context, listen: false).fetchDoctor();
  // }

  void navigateToSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  final List<Widget> _screens = const <Widget>[
    DocChats(),
    AppointmentScreen(),
    DocMore(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: navigateToSelected,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          items: [
            //chats
            BottomNavigationBarItem(
              label: "Chats",
              icon: SvgPicture.asset(
                AppImages.home,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.home_filled,
                fit: BoxFit.contain,
              ),
            ),

            // calls
            BottomNavigationBarItem(
              label: "Appointments",
              icon: SvgPicture.asset(
                AppImages.history,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.history_filled,
                fit: BoxFit.contain,
              ),
            ),
            // calls
            BottomNavigationBarItem(
              label: "Calls",
              icon: SvgPicture.asset(
                AppImages.history,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.history_filled,
                fit: BoxFit.contain,
              ),
            ),

            // more
            BottomNavigationBarItem(
              label: "More",
              icon: SvgPicture.asset(
                AppImages.doc,
                fit: BoxFit.contain,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.doc_filled,
                fit: BoxFit.contain,
              ),
            ),
          ]),
    );
  }
}
