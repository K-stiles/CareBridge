// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:intl/intl.dart';
// import 'package:the_rock_mobile/constants/app_sizes.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:the_rock_mobile/models/response/appointment_model.dart';
// import 'package:the_rock_mobile/screens/app/doctor/doc_appointment_card.dart';
// import 'package:the_rock_mobile/screens/app/doctor/doc_consultation_history.dart';
// import 'package:the_rock_mobile/screens/app/doctor/widget/doc_appbar.dart';
// import 'package:the_rock_mobile/services/patient/appointment_service.dart';

// class DoctorAppointments extends StatefulWidget {
//   static const String namedRoute = "/doc-calls";

//   const DoctorAppointments({super.key});

//   @override
//   State<DoctorAppointments> createState() =>
//       _DoctorAppointmentsState();
// }

// class _DoctorAppointmentsState extends State<DoctorAppointments> {
//   // DateTime selectedDate = DateTime.now();
//   DateTime _today = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDay = _today;
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime today) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _today = today;
//       });
//     }
//   }

//   List<Appointment> filterAppointmentsByDate(List<Appointment> appointments) {
//     String formattedSelectedDate =
//         DateFormat("yyyy-MM-dd").format(_selectedDay!);

//     return appointments.where((appointment) {
//       String formattedAppointmentDate =
//           DateFormat("yyyy-MM-dd").format(appointment.scheduledDate);
//       return formattedAppointmentDate == formattedSelectedDate;
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;

//     void gotoHistory() {
//       Get.to(() => const DocConsultationHistory());
//     }

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           /// app bar
//           const DocAppBar(),

//           /// body
//           Expanded(
//               child: ListView(
//             physics: const AlwaysScrollableScrollPhysics(),
//             padding: const EdgeInsets.all(AppSizes.md),
//             children: <Widget>[
//               /// history icon-btn
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTap: gotoHistory,
//                     child: Column(
//                       children: [
//                         Icon(Icons.calendar_month_outlined,
//                             color: colorScheme.primary),
//                         const SizedBox(height: AppSizes.xs),
//                         Text(
//                           "History",
//                           style: textTheme.bodySmall!
//                               .copyWith(color: colorScheme.primary),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),

//               const SizedBox(height: AppSizes.sm),

//               /// CALENDAR
//               // Container(
//               //   width: double.infinity,
//               //   decoration: BoxDecoration(
//               //       color: Colors.white,
//               //       border: Border.all(
//               //         color: Colors.grey.shade200,
//               //       ),
//               //       borderRadius: BorderRadius.circular(AppSizes.base_)),
//               //   child:
//               TableCalendar(
//                 firstDay: DateTime.utc(2010, 10, 16),
//                 lastDay: DateTime.utc(2030, 3, 14),
//                 focusedDay: _today,
//                 selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                 startingDayOfWeek: StartingDayOfWeek.monday,
//                 onDaySelected: _onDaySelected,
//                 availableGestures: AvailableGestures.all,
//                 rowHeight: 40,
//                 calendarStyle: CalendarStyle(
//                   todayTextStyle: TextStyle(
//                     color: colorScheme.background,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   todayDecoration: BoxDecoration(
//                       color: colorScheme.primary, shape: BoxShape.circle),
//                 ),
//                 headerStyle: HeaderStyle(
//                   formatButtonVisible: false,
//                   titleCentered: true,
//                   headerMargin: const EdgeInsets.only(bottom: AppSizes.md),
//                   decoration: BoxDecoration(
//                     color: colorScheme.primary.withOpacity(0.1),
//                   ),
//                   titleTextStyle: TextStyle(
//                     fontSize: 17.0,
//                     fontWeight: FontWeight.bold,
//                     color: colorScheme.primary,
//                   ),
//                 ),
//               ),
//               // ),

//               const SizedBox(height: AppSizes.lg),

//               /** TODAY  */
//               Text(
//                 "Today",
//                 style: textTheme.displayMedium!
//                     .copyWith(color: Colors.grey.shade800),
//               ),

//               /// APPOINTMENT LIST
//               Expanded(
//                 child: FutureBuilder<List<Appointment>>(
//                   future: AppointmentService.fecthAppointments(
//                     query: "page=1&pageSize=100",
//                   ),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 20.0),
//                         child: Text("loading..."),
//                       );
//                     } else if (snapshot.hasData) {
//                       List<Appointment> allAppointments = snapshot.data!;
//                       List<Appointment> filteredAppointments =
//                           filterAppointmentsByDate(allAppointments);

//                       if (filteredAppointments.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.symmetric(vertical: AppSizes.md),
//                           child: Text("No Appointments for you today Doc!"),
//                         );
//                       }

//                       return ListView.separated(
//                         physics: const NeverScrollableScrollPhysics(),
//                         padding:
//                             const EdgeInsets.symmetric(vertical: AppSizes.md),
//                         scrollDirection: Axis.vertical,
//                         shrinkWrap: true,
//                         itemCount: filteredAppointments.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           Appointment appointment = filteredAppointments[index];

//                           return DocAppointmentCard(
//                             card: appointment,
//                           );
//                         },
//                         separatorBuilder: (BuildContext context, int index) {
//                           return const SizedBox(height: AppSizes.sm);
//                         },
//                       );
//                     } else if (snapshot.hasError) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 20.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               "Error fetching doctors...",
//                               style: TextStyle(color: Colors.grey.shade800),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               "Please check your internet",
//                               style: TextStyle(
//                                   color: Colors.grey.shade500, fontSize: 15),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else {
//                       return const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 20.0),
//                         child: Text("Something went wrong...!"),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }

