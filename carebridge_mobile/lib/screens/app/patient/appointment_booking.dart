import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:the_rock_mobile/components/exports.dart';
import 'package:the_rock_mobile/constants/app_images.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';

import 'package:the_rock_mobile/models/communication_medium.dart';
import 'package:the_rock_mobile/models/response/offered_service_resp.dart';

import 'package:the_rock_mobile/models/response/payload_appointment.dart';
import 'package:the_rock_mobile/providers/exports.dart';

class BookAppointment extends StatefulWidget {
  static const String namedRoute = "/book-appointment";

  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  bool isbooking = false;
  OfferedServiceResp? selectedService;
  Doctor? selectedDoctor;

  final int inputTitleFlex = 1;

  int bkSelectedCommunicationMode = 0;
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OfferedServiceNotifier>(context, listen: false)
          .fetchServices();
    });
  }

  final TextEditingController complaintController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appointmentNotifier = Provider.of<AppointmentNotifier>(context);
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    void goBack() => Get.back();

    // void openSavePopup() {
    //   showDialog(
    //     barrierDismissible: false,
    //     context: context,
    //     builder: (context) => const BookingPopUp(),
    //   );
    // }

    String checkMedium() {
      List<String> modes = ["CHAT", "VIDEO_CALL", "VOICE_CALL"];
      String medium = modes[bkSelectedCommunicationMode];
      return medium;
    }

    /// SUBMIT BOOKING
    void bookAppointment() async {
      /// VALIDATE SERVICE DROPDOWN && DOCTOR DROPDOWN
      /// VALIDATE DATE PICKED && TIME PICKED
      /// VALIDATE TEXTAREA
      /// VALIDATE COMMUNICATION MEDIUMN
      /// IF ALL PASS POST TO SERVER
      final isValidForm = formKey.currentState!.validate();
      if (isValidForm) {
        /// FORM IS VALID AND FILLED
        String complaint = complaintController.text.trim();

        /// Convert TimeOfDay to a Duration
        final timeDuration = timeOfDay.hour * 3600 + timeOfDay.minute * 60;

        /// Combine the DateTime and TimeOfDay into a single DateTime
        DateTime combinedDateTime =
            dateTime.add(Duration(seconds: timeDuration));

        /// DATETIME FORMATTER
        final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        String formattedDate = formatter.format(combinedDateTime);

        // print("complaint: ==========> $complaint");
        // print("scheduledDate: ==========>  $formattedDate");
        // print("checkMedium(): ==========> ${checkMedium()}");
        // print("selectedService: ==========> ${selectedService?.id}");
        // print("selectedDoctor: ==========> ${selectedDoctor?.id}");

        CreateAppointmentPayload appointmentPayload = CreateAppointmentPayload(
          complaint: complaint,
          scheduledDate: formattedDate,
          medium: checkMedium(),
          serviceId: selectedService!.id,
          doctorId: selectedDoctor!.id,
        );

        appointmentNotifier.createAppointment(appointmentPayload);
      } else {
        Get.snackbar("oOps... ", "Please fill your booking form correctly",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
            icon: const Icon(
              FluentIcons.warning_12_filled,
              color: Colors.white,
            ));
      }
    }

    void openDatePicker() {
      showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
      ).then((value) => setState(() => dateTime = value!));
    }

    void openTimePicker() {
      showTimePicker(
        context: context,
        initialTime: timeOfDay,
      ).then((time) => setState(() => timeOfDay = time!));
    }

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        /// App BAr
        PurpleAppBar(
          height: appHeight * .12,
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

                SizedBox(width: appWidth * 0.18),

                /// title
                Text(
                  "Book Appointment",
                  style: textTheme.displayMedium!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(AppSizes.md),
              children: [
                /// SERVICE CONSUMER
                Row(
                  children: [
                    Expanded(
                        flex: inputTitleFlex,
                        child: const Text("Select Service")),
                    Expanded(
                      flex: 3,
                      child: DropSelectionWithIcon(
                        svg: SvgPicture.asset(
                          AppImages.servicecard,
                          fit: BoxFit.contain,
                          height: 20,
                        ),
                        child: Consumer<OfferedServiceNotifier>(
                          builder: (context, data, child) {
                            final services = data.offeredServices;
                            return DropdownButtonFormField<OfferedServiceResp>(
                              hint: const Text("select service"),
                              value: selectedService,
                              validator: (value) => value == null
                                  ? ''
                                  // ? 'Please selectselect a service'
                                  : null,
                              onChanged: (OfferedServiceResp? newValue) {
                                setState(() {
                                  selectedService = newValue;
                                  selectedDoctor =
                                      null; // Reset the selected doctor when changing the service
                                });
                              },
                              items: services.map((service) {
                                return DropdownMenuItem<OfferedServiceResp>(
                                  value: service,
                                  child: Text(service.name),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.sm),

                /// DOCTOR CONSUMER
                Row(
                  children: [
                    Expanded(
                        flex: inputTitleFlex,
                        child: const Text("Select \nDoctor")),
                    Expanded(
                      flex: 3,
                      child: DropSelectionWithIcon(
                        svg: SvgPicture.asset(
                          AppImages.servicecard,
                          fit: BoxFit.contain,
                          height: 20,
                        ),
                        child: Column(
                          children: [
                            /// Show doctor dropdown only if a service is selected
                            if (selectedService != null)
                              Consumer<OfferedServiceNotifier>(
                                builder: (context, data, child) {
                                  final doctors = selectedService!.doctors;
                                  return DropdownButtonFormField<Doctor>(
                                    hint: doctors.isEmpty
                                        ? const Text("no doctor under service")
                                        : const Text("select doctor"),
                                    isExpanded: true,
                                    value: selectedDoctor,
                                    validator: (value) =>
                                        value == null ? '' : null,
                                    onChanged: (Doctor? newValue) {
                                      setState(() {
                                        selectedDoctor = newValue;
                                      });
                                    },
                                    items: doctors.map((doctor) {
                                      return DropdownMenuItem<Doctor>(
                                        value: doctor,
                                        child: Text(doctor.fullname),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),

                            /// DISABLED DUMMY DROPDOWN FOR VISUALS
                            if (selectedService == null)
                              DropdownButtonFormField(
                                hint: const Text("select doctor"),
                                items: const [],
                                onChanged: (e) {},
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.lg),

                /// SELECTION 3
                Row(
                  children: [
                    Expanded(
                        flex: inputTitleFlex, child: const Text("Select Date")),
                    Expanded(
                      flex: 3,
                      child: PickDateTime(
                        onTap: openDatePicker,
                        // dateTime: dateTime.toString(),
                        dateTime: DateFormat("yyy-MM-dd").format(dateTime),
                        icon: SvgPicture.asset(
                          AppImages.calendar,
                          fit: BoxFit.contain,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.sm),

                /// SELECTION 4
                Row(
                  children: [
                    Expanded(
                        flex: inputTitleFlex, child: const Text("Select Time")),
                    Expanded(
                      flex: 3,
                      child: PickDateTime(
                        dateTime: timeOfDay.format(context).toString(),
                        icon: SvgPicture.asset(
                          AppImages.time,
                          fit: BoxFit.contain,
                          height: 20,
                        ),
                        onTap: () => openTimePicker(),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.sm),

                /// SELECTION 5
                ComplaintBox(
                  controller: complaintController,
                  validator: (String? complaint) {
                    if (complaint!.isEmpty) {
                      return "Complaint field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),

                const SizedBox(height: AppSizes.md),

                /// SELECTION 6
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Consultation \nType 30mins"),
                      ],
                    ),

                    const SizedBox(width: AppSizes.xs),

                    /// ConsultationMedium
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: communicationMode.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          bool active = bkSelectedCommunicationMode == index;
                          return ConsultationButton(
                            onTap: () => setState(
                                () => bkSelectedCommunicationMode = index),
                            label: Text(
                              communicationMode[index].title,
                              style: textTheme.bodyMedium!.copyWith(
                                  color: active
                                      ? colorScheme.primary
                                      : Colors.grey.shade700),
                            ),
                            icon: communicationMode[index].icon,
                            borderColor:
                                active ? Colors.white : Colors.grey.shade300,
                            background: active
                                ? colorScheme.primary.withOpacity(0.2)
                                : Colors.white,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: AppSizes.sm);
                        },
                      ),
                    )
                  ],
                ),

                const SizedBox(height: AppSizes.lg),

                /// button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: ElevatedButton(
                    onPressed: bookAppointment,
                    child: appointmentNotifier.processing
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("Booking..."),
                            ],
                          )
                        : const Text("Book Appointment"),
                  ),
                ),

                const SizedBox(height: AppSizes.lg * 2),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
