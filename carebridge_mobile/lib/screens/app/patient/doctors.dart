import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/app_title_bar.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/doctor_model.dart';
import 'package:the_rock_mobile/screens/app/patient/doctor_info.dart';
import 'package:the_rock_mobile/services/doctor/doctor_service.dart';

class Doctors extends StatefulWidget {
  static const String namedRoute = "/top-doctors";
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  final List<Doctor> _doctors = [];
  List<Doctor> _temporaryList = [];
  String query = '';

  @override
  void initState() {
    super.initState();

    DoctorService()
        .fecthDoctors(query: "page=1&pageSize=100&sort=fullname&order=asc")
        .then((doctorsList) {
      setState(() {
        _doctors.addAll(doctorsList);
        _temporaryList = _doctors;
      });
    });
  }

  Future<void> searchPatient(String query) async {
    final queryString = query.toLowerCase();
    final searchResult = _doctors.where((doctor) {
      final doctorFullname = doctor.fullname.toLowerCase();
      final doctorEmail = doctor.email.toLowerCase();
      return doctorFullname.contains(queryString) ||
          doctorEmail.contains(queryString);
    }).toList();
    setState(() => _temporaryList = searchResult);
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;

    void gotoDocInfo(int id, Doctor doctor) {
      Get.to(
        () => const DoctorInfo(),
        arguments: {
          "id": doctor.id,
          "name": doctor.fullname,
          "image": doctor.profile,
          "about": doctor.email,
        },
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // app bar
          SizedBox(
            height: appHeight * .20,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topStart,
              children: [
                const PurpleAppTitleBar(title: "Doctors"),
                Positioned(
                  top: appHeight * .14,
                  left: 32,
                  child: SearchField(
                    hintText: "Search services, doctors",
                    onChanged: (query) => searchPatient(query),
                  ),
                ),
              ],
            ),
          ),

          /// LISTVIEW
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: AppSizes.md),
              scrollDirection: Axis.vertical,
              itemCount: _temporaryList.length,
              shrinkWrap: true,
              separatorBuilder: (context, inndex) =>
                  const SizedBox(height: AppSizes.base_),
              itemBuilder: (BuildContext context, int index) {
                final Doctor doctor = _temporaryList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: DocListTile(
                      doctor: doctor, onTap: () => gotoDocInfo(index, doctor)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
