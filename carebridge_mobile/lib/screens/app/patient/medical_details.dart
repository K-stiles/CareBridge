import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/components/radio_group.dart';
import 'package:the_rock_mobile/constants/app_preference.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/requests/add_medicals.dart';
import 'package:the_rock_mobile/providers/exports.dart';

import 'app.dart';

// enum PatientResponse { yes, no }

class MedicalDetails extends StatefulWidget {
  static const String namedRoute = "/medical-details";

  const MedicalDetails({super.key});

  @override
  State<MedicalDetails> createState() => _MedicalDetailsState();
}

class _MedicalDetailsState extends State<MedicalDetails> {
  bool isReady = false;

  PatientResponse? _patientResponseChoiceOne;
  PatientResponse? _patientResponseChoiceTwo;
  PatientResponse? _patientResponseChoiceThree;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController chronicDiseaseInfo = TextEditingController();
  TextEditingController allergiesInfo = TextEditingController();
  TextEditingController medicalConditionInfo = TextEditingController();

  void checkReadyState() {
    if (_patientResponseChoiceOne == PatientResponse.no &&
            chronicDiseaseInfo.text.isNotEmpty ||
        _patientResponseChoiceOne == null) {
      // chronicDiseaseInfo.clear();
      chronicDiseaseInfo.text = "";
    }
    if (_patientResponseChoiceTwo == PatientResponse.no &&
            allergiesInfo.text.isNotEmpty ||
        _patientResponseChoiceTwo == null) {
      // allergiesInfo.clear();
      allergiesInfo.text = "";
    }

    if (_patientResponseChoiceThree == PatientResponse.no &&
            medicalConditionInfo.text.isNotEmpty ||
        _patientResponseChoiceThree == null) {
      // medicalConditionInfo.clear();
      medicalConditionInfo.text = "";
    }
  }

  @override
  void dispose() {
    chronicDiseaseInfo.dispose();
    allergiesInfo.dispose();
    medicalConditionInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final medicalsNotifier = Provider.of<MedicalsNotifier>(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    Map<String, dynamic> patientMedicalData = Get.arguments;

    void goBack() => Get.back();
    void goHome() => Get.offAll(() => const App());

    void onSave() async {
      checkReadyState();
      final chronicDiseaseData = chronicDiseaseInfo.text.trim();
      final allergiesInfoData = allergiesInfo.text.trim();
      final medicalConditionInfoData = medicalConditionInfo.text.trim();

      final bool chronicStatus =
          _patientResponseChoiceOne == PatientResponse.yes ? true : false;
      final bool allergyStatus =
          _patientResponseChoiceTwo == PatientResponse.yes ? true : false;
      final bool medicalsStatus =
          _patientResponseChoiceThree == PatientResponse.yes ? true : false;

      final bool falsy = _patientResponseChoiceOne == null &&
          _patientResponseChoiceTwo == null &&
          _patientResponseChoiceThree == null;

      final isValidForm = formKey.currentState!.validate();
      if (isValidForm && !falsy) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? patientId = prefs.getString(AppPreference.authuserId);
        // print("_patientResponseChoiceOne: $chronicStatus");
        // print("_patientResponseChoiceOne: $chronicStatus");
        // print("_patientResponseChoiceTwo: $allergyStatus");
        // print("\nfalsy: $falsy\n");

        // print(chronicDiseaseData);
        // print(allergiesInfoData);
        // print(medicalConditionInfoData);

        // print("${patientMedicalData["fullname"]}");
        // print("${patientMedicalData["location"]}");
        // print("${patientMedicalData["height"]}");
        // print("${patientMedicalData["weight"]}");
        // print("${patientMedicalData["dateOfBirth"]}");

        AddMedicalsPayload medicalsPayload = AddMedicalsPayload(
          patientId: patientId ?? "",
          height: double.parse(patientMedicalData["height"]),
          weight: double.parse(patientMedicalData["weight"]),
          dateOfBirth: patientMedicalData["dateOfBirth"] as String,
          location: patientMedicalData["location"],
          chronicDiseaseStatus: chronicStatus,
          chronicDiseaseInfo: chronicDiseaseData,
          allergiesStatus: allergyStatus,
          allergiesInfo: allergiesInfoData,
          medicalConditionStatus: medicalsStatus,
          medicalConditionInfo: medicalConditionInfoData,
        );

        medicalsNotifier.addMedicals(medicalsPayload);
      } else {
        Get.snackbar("Oops...", "Please correctly fill the form.",
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkButton(onTap: goBack),
        actions: [
          TextButton(
              onPressed: goHome,
              child: Text(
                "Skip",
                style: textTheme.displaySmall!
                    .copyWith(color: colorScheme.primary),
              ))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.xl,
            vertical: AppSizes.md,
          ),
          child: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Medical Details", style: textTheme.displayLarge),

                  const SizedBox(height: AppSizes.md),

                  /// QUEST 1
                  Text("Do you have any chronic condition?",
                      style: textTheme.bodyLarge),

                  /// QUEST 1
                  Row(
                    children: [
                      RadioOption(
                        title: PatientResponse.yes.name,
                        value: PatientResponse.yes,
                        selectedPatientResponse: _patientResponseChoiceOne,
                        onChanged: (value) =>
                            setState(() => _patientResponseChoiceOne = value!),
                      ),
                      RadioOption(
                        title: PatientResponse.no.name,
                        value: PatientResponse.no,
                        selectedPatientResponse: _patientResponseChoiceOne,
                        onChanged: (value) =>
                            setState(() => _patientResponseChoiceOne = value),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.base_),

                  _patientResponseChoiceOne == PatientResponse.yes
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Please Specify", style: textTheme.bodyMedium),
                            const SizedBox(height: AppSizes.base_),
                            ComplaintTextArea(
                              controller: chronicDiseaseInfo,
                              validator: (data) {
                                if (data!.isEmpty &&
                                    _patientResponseChoiceOne ==
                                        PatientResponse.yes) {
                                  return "Please state or explain the chronic disease here";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        )
                      : const SizedBox(height: AppSizes.md),

                  const SizedBox(height: AppSizes.md),

                  /// QUEST 2
                  Text("Do you have any allergies?",
                      style: textTheme.bodyLarge),
                  Row(
                    children: [
                      RadioOption(
                        title: PatientResponse.yes.name,
                        value: PatientResponse.yes,
                        selectedPatientResponse: _patientResponseChoiceTwo,
                        onChanged: (value) =>
                            setState(() => _patientResponseChoiceTwo = value!),
                      ),
                      RadioOption(
                        title: PatientResponse.no.name,
                        value: PatientResponse.no,
                        selectedPatientResponse: _patientResponseChoiceTwo,
                        onChanged: (value) =>
                            setState(() => _patientResponseChoiceTwo = value),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.base_),

                  _patientResponseChoiceTwo == PatientResponse.yes
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Please Specify", style: textTheme.bodyMedium),
                            const SizedBox(height: AppSizes.base_),
                            ComplaintTextArea(
                              controller: allergiesInfo,
                              validator: (data) {
                                if (data!.isEmpty &&
                                    _patientResponseChoiceTwo ==
                                        PatientResponse.yes) {
                                  return "Please state or explain the allergy or allergies here";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        )
                      : const SizedBox(height: AppSizes.md),

                  const SizedBox(height: AppSizes.md),

                  /// QUEST 3
                  Text("Are you on any medication?",
                      style: textTheme.bodyLarge),
                  Row(
                    children: [
                      RadioOption(
                        title: PatientResponse.yes.name,
                        value: PatientResponse.yes,
                        selectedPatientResponse: _patientResponseChoiceThree,
                        onChanged: (value) => setState(
                            () => _patientResponseChoiceThree = value!),
                      ),
                      RadioOption(
                        title: PatientResponse.no.name,
                        value: PatientResponse.no,
                        selectedPatientResponse: _patientResponseChoiceThree,
                        onChanged: (value) =>
                            setState(() => _patientResponseChoiceThree = value),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.base_),

                  _patientResponseChoiceThree == PatientResponse.yes
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Please Specify", style: textTheme.bodyMedium),
                            const SizedBox(height: AppSizes.base_),
                            ComplaintTextArea(
                              controller: medicalConditionInfo,
                              validator: (data) {
                                if (data!.isEmpty &&
                                    _patientResponseChoiceThree ==
                                        PatientResponse.yes) {
                                  return "Please state or explain the medical condition here";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        )
                      : const SizedBox(height: AppSizes.md),

                  const SizedBox(height: AppSizes.lg),
                  ElevatedButton(
                    onPressed: () => onSave(),
                    child: const Text("Save"),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
