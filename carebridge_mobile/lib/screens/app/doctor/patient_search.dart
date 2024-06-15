import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/components/patient_tile.dart';
import 'package:the_rock_mobile/components/searchfield.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/response/patient_model.dart';
import 'package:the_rock_mobile/screens/app/doctor/lab_test_request.dart';
import 'package:the_rock_mobile/screens/app/doctor/prescription.dart';
import 'package:the_rock_mobile/services/patient/patient_service.dart';

class PatientSearch extends StatefulWidget {
  static const namedRoute = "/patient-search";
  const PatientSearch({super.key});
  @override
  State<PatientSearch> createState() => _PatientSearchState();
}

class _PatientSearchState extends State<PatientSearch> {
  final List<PatientModel> _patients = [];
  List<PatientModel> _temporaryList = [];
  String query = '';

  @override
  void initState() {
    super.initState();

    PatientService().fecthPatients(query).then((patientsList) {
      setState(() {
        _patients.addAll(patientsList);
        _temporaryList = _patients;
      });
    });
  }

  Future<void> searchPatient(String query) async {
    final queryString = query.toLowerCase();
    final searchResult = _patients.where((patient) {
      final patientFullname = patient.fullname.toLowerCase();
      final patientEmail = patient.email.toLowerCase();
      return patientFullname.contains(queryString) ||
          patientEmail.contains(queryString);
    }).toList();
    setState(() => _temporaryList = searchResult);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> routeData = Get.arguments;

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Get.back();

    void getPatient(PatientModel patient) {
      if (routeData["route"] == LabTestRequest.namedRoute) {
        Get.to(
          () => const LabTestRequest(),
          arguments: {
            "id": patient.id,
            "name": patient.fullname,
          },
        );
      } else if (routeData["route"] == Prescription.namedRoute) {
        Get.to(
          () => const Prescription(),
          arguments: {
            "id": patient.id,
            "name": patient.fullname,
          },
        );
      } else {
        Get.snackbar("Navigation Error", "Route doesnot exist",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // APP BAR
          Container(
            color: Colors.transparent,
            height: appHeight * .199,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topStart,
              children: [
                /// PurpleAppBar

                PurpleAppBar(
                  height: appHeight * .16,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
                  child: Container(
                    alignment: const Alignment(0, 0.3),
                    child: Row(
                      children: [
                        InkButton(
                          onTap: goBack,
                          borderRadius: AppSizes.md,
                          background: colorScheme.background,
                          iconColor: colorScheme.primary,
                        ),

                        SizedBox(width: appWidth * 0.26),

                        // title
                        Text(
                          "Patients",
                          style: textTheme.displayMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                /// search bar
                Positioned(
                  top: appHeight * .14,
                  left: 32,
                  child: SearchField(
                    hintText: "Search patient",
                    onChanged: (query) => searchPatient(query),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

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
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: PatientTile(
                    patient: _temporaryList[index],
                    onTap: () => getPatient(_temporaryList[index]),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
