import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/screens/app/doctor/lab_test_request.dart';
import 'package:the_rock_mobile/screens/app/doctor/patient_search.dart';
import 'package:the_rock_mobile/screens/app/doctor/prescription.dart';
import 'package:the_rock_mobile/screens/app/doctor/widget/doc_appbar.dart';

class DocMore extends StatelessWidget {
  static const String namedRoute = "/doc-more";

  const DocMore({super.key});

  @override
  Widget build(BuildContext context) {
    // final doctorProvider = Provider.of<DoctorProvider>(context);
    // final pickProfileProvider = Provider.of<PickProfileProvider>(context);

    // final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // void gotoNotification() {
    //   Get.to(() => const Notify());
    // }

    // void gotoProfile() {
    //   Get.to(() => const DoctorProfile());
    // }

    void prescribeDrug() {
      Get.to(() => const PatientSearch(),
          arguments: {"route": Prescription.namedRoute});
    }

    void requestLabTest() {
      Get.to(() => const PatientSearch(),
          arguments: {"route": LabTestRequest.namedRoute});
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// app bar
          const DocAppBar(),

          /// body
          Expanded(
              child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppSizes.lg),
            children: <Widget>[
              /// button 1
              OutlinedButton(
                onPressed: requestLabTest,
                child: const Text("Request Lab Test"),
              ),

              const SizedBox(height: AppSizes.md),

              /// button 2
              OutlinedButton(
                  onPressed: prescribeDrug,
                  child: const Text("Prescribe drugs")),

              const SizedBox(height: AppSizes.lg),

              /// amount body
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.base_, vertical: AppSizes.lg),
                width: appWidth * 0.7,
                decoration: BoxDecoration(
                  color: colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(AppSizes.base_),
                ),
                child: Column(children: <Widget>[
                  /// earnings
                  Text(
                    "My Earnings",
                    style:
                        textTheme.bodySmall!.copyWith(color: Colors.grey[600]),
                  ),

                  const SizedBox(height: AppSizes.sm),

                  /// money
                  Text(
                    "GHS 700, 000",
                    style: textTheme.headlineMedium!
                        .copyWith(color: colorScheme.primary),
                  ),

                  const SizedBox(height: AppSizes.sm),

                  /// date
                  Text(
                    "Last cashout was May 15, 2023",
                    style:
                        textTheme.bodySmall!.copyWith(color: Colors.grey[600]),
                  ),
                ]),
              ),

              const SizedBox(height: AppSizes.lg),

              /// button 3
              OutlinedButton(
                onPressed: () {},
                child: const Text("Withdraw funds"),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
