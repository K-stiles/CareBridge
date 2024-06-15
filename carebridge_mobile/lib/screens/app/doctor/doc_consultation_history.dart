import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/response/appointment_model.dart';
import 'package:the_rock_mobile/screens/app/doctor/consultation_history_popup.dart';
import 'package:the_rock_mobile/services/patient/appointment_service.dart';

class DocConsultationHistory extends StatelessWidget {
  static const String namedRoute = "/doc-consultation-history";

  const DocConsultationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Get.back();

    void openPopUp(int index) {
      showDialog(
        context: context,
        builder: (context) => const ConstHistPopup(),
        barrierDismissible: true,
      );
    }

    List<Appointment> filterAppointmentsByDate(List<Appointment> appointments) {
      List<Appointment> filteredAppointments =
          appointments.where((appointment) {
        DateTime scheduledDateWithoutTime = DateTime(
          appointment.scheduledDate.year,
          appointment.scheduledDate.month,
          appointment.scheduledDate.day,
        );

        DateTime todayWithoutTime = DateTime(
          today.year,
          today.month,
          today.day,
        );

        return scheduledDateWithoutTime.isBefore(todayWithoutTime);
      }).toList();

      /// Sort the filtered appointments in descending order based on scheduledDate
      filteredAppointments
          .sort((a, b) => b.scheduledDate.compareTo(a.scheduledDate));

      return filteredAppointments;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// app bar
          PurpleAppBar(
            height: appHeight * .14,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs),
            child: Container(
              alignment: const Alignment(0, 0.5),
              child: Row(
                children: [
                  InkButton(
                    onTap: goBack,
                    borderRadius: AppSizes.md,
                    background: colorScheme.background,
                    iconColor: colorScheme.primary,
                  ),

                  SizedBox(width: appWidth * 0.16),

                  // title
                  Text(
                    "Consultation History",
                    style:
                        textTheme.displayMedium!.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: FutureBuilder<List<Appointment>>(
              future: AppointmentService.fecthAppointments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("loading..."),
                  );
                } else if (snapshot.hasData) {
                  List<Appointment> allAppointments = snapshot.data!;
                  List<Appointment> filteredAppointments =
                      filterAppointmentsByDate(allAppointments);

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: filteredAppointments.length,
                    itemBuilder: (BuildContext context, int index) {
                      Appointment appointment = filteredAppointments[index];
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSizes.md),
                        child: ConstHisCard(
                            card: appointment, onTap: () => openPopUp(index)),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
                        child: Divider(height: AppSizes.base_, thickness: 1),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Error fetching doctors...",
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Please check your internet",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Something went wrong...!"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
