import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:the_rock_mobile/components/app_bar.dart';
import 'package:the_rock_mobile/components/doc_list_tile.dart';
import 'package:the_rock_mobile/components/ink_button.dart';
import 'package:the_rock_mobile/components/searchfield.dart';
import 'package:the_rock_mobile/constants/app_sizes.dart';
import 'package:the_rock_mobile/models/doctor_model.dart';
import 'package:the_rock_mobile/screens/app/patient/doctor_info.dart';
import 'package:the_rock_mobile/services/doctor/doctor_service.dart';
// import 'package:the_rock_mobile/screens/app/doctor_info.dart';
// import 'package:the_rock_mobile/services/doctor_service.dart';

// import '../../models/doctor_model.dart';

class TopDoctors extends StatefulWidget {
  static const String namedRoute = "/top-doctors";
  const TopDoctors({super.key});

  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  final List<Doctor> _doctors = [];
  List<Doctor> _temporaryList = [];
  String query = '';

  @override
  void initState() {
    super.initState();

    /// TODOMODIFY QUERY AS PULL TO FETCH MORE(Infinit scroll)
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
    final appWidth = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final navigator = Navigator.of(context);

    void goBack() => navigator.pop(context);

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
          Container(
            color: Colors.transparent,
            height: appHeight * .199,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topStart,
              children: [
                /// app bar

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

                        SizedBox(width: appWidth * 0.22),

                        // title
                        Text(
                          "Search Doctor",
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
                    hintText: "Search doctors and services",
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
